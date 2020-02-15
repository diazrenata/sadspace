library(drake)
library(sadspace)

expose_imports("sadspace")

sv <- define_statevars()

sv2 <- sv %>%
  dplyr::select(s0) %>%
  dplyr::distinct() %>%
  dplyr::mutate(n0 = ceiling(s0 + max(.01 * s0, 4))) %>%
  dplyr::filter(n0 < 1.5 * s0)

sv <- dplyr::bind_rows(sv, sv2) %>%
  assign_ptable() %>%
  dplyr::filter(p_table != "none")

#sv <- sv[1:10, ]

p_table_list <- as.list(as.character(sv$p_table))
p_table_list <- lapply(p_table_list, FUN = rlang::sym)

max_draws <- 10000
set.seed(1977)
sample_plan <- drake_plan(
 wide = target(readRDS(here::here("analysis", "masterp_wide.Rds"))),
  tall = target(readRDS(here::here("analysis", "masterp_tall.Rds"))),
  mamm = target(readRDS(here::here("analysis", "masterp_mamm.Rds"))),
  fs = target(sample_fs(s, n, nsamples = !!max_draws, p_table),
                   transform = map(s = !!sv$s0,
                                   n = !!sv$n0,
                                   p_table =!!p_table_list,
                                   .id = c(s, n))),
  di = target(fs_di(fs),
                    transform = map(fs))
)


## Set up the cache and config
db <- DBI::dbConnect(RSQLite::SQLite(), here::here("analysis", "drake", "drake-cache.sqlite"))
cache <- storr::storr_dbi("datatable", "keystable", db)

## View the graph of the plan
if (interactive())
{
  config <- drake_config(sample_plan, cache = cache)
  sankey_drake_graph(config, build_times = "none")  # requires "networkD3" package
  vis_drake_graph(config, build_times = "none")     # requires "visNetwork" package
}

## Run the pipeline
nodename <- Sys.info()["nodename"]
if(grepl("ufhpc", nodename)) {
  print("I know I am on the HiPerGator!")
  library(clustermq)
  options(clustermq.scheduler = "slurm", clustermq.template = "slurm_clustermq.tmpl")
  ## Run the pipeline parallelized for HiPerGator
  make(sample_plan,
       force = TRUE,
       cache = cache,
       cache_log_file = here::here("analysis", "drake", "cache_log.txt"),
       verbose = 2,
       parallelism = "clustermq",
       jobs = 50,
       caching = "master", memory_strategy = "autoclean") # Important for DBI caches!
} else {
  library(clustermq)
  options(clustermq.scheduler = "multicore")
  # Run the pipeline on multiple local cores
  system.time(make(sample_plan, cache = cache, cache_log_file = here::here("analysis", "drake", "cache_log.txt"), parallelism = "clustermq", jobs = 2))
}
#
# system.time(make(sample_plan, cache = cache, cache_log_file = here::here("analysis", "drake", "cache_log.txt")))

dis <- sample_plan %>%
  dplyr::filter(substr(target, 0, 2) == "di") %>%
  dplyr::select(target) %>%
  as.matrix() %>%
  as.list()

di_dfs <- lapply(dis, FUN = function(di_name) return(readd(di_name, cache = cache, character_only = T)))

di_dfs <- dplyr::bind_rows(di_dfs) %>%
  dplyr::mutate(max_draws = max_draws)


fs_size_dat <- di_dfs %>%
  dplyr::select(s0, n0, nparts, nunique, max_draws) %>%
  dplyr::distinct() %>%
  dplyr::mutate(log_nparts = log(as.numeric(nparts)),
         log_nunique = log(nunique))

di_summary_df <- di_dfs %>%
  dplyr::group_by(s0, n0, nparts, nunique, max_draws) %>%
  dplyr::summarize(mean_skew = mean(skew, na.rm = T),
            sd_skew = sd(skew, na.rm = T),
            range_skew = max(skew, na.rm = T) - min(skew, na.rm = T),
            median_skew = median(skew, na.rm = T),
            median_simpson = median(simpson, na.rm = T),
            mean_simpson = mean(simpson, na.rm = T),
            sd_simpson = sd(simpson, na.rm = T),
            range_simpson = max(simpson, na.rm = T) - min(simpson, na.rm = T)) %>%
  dplyr::ungroup() %>%
  dplyr::mutate(log_nunique = log(nunique),
         log_nparts = log(as.numeric(nparts)))

write.csv(di_dfs, here::here("analysis", "di_dfs.csv"), row.names = F)
write.csv(fs_size_dat, here::here("analysis", "fs_size_dat.csv"), row.names = F)
write.csv(di_summary_df, here::here("analysis", "di_summary_df.csv"), row.names = F)
DBI::dbDisconnect(db)
rm(cache)
print("Completed OK")
