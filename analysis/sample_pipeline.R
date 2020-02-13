library(drake)
library(sadspace)

expose_imports("sadspace")

sv <- define_statevars() %>%
  assign_ptable() %>%
  dplyr::filter(p_table != "none")

sv <- sv[1:10, ]

p_table_list <- as.list(as.character(sv$p_table))
p_table_list <- lapply(p_table_list, FUN = rlang::sym)

max_draws <- 100
set.seed(1977)
sample_plan <- drake_plan(
 # wide = target(readRDS(here::here("analysis", "masterp_wide.Rds"))),
  #tall = target(readRDS(here::here("analysis", "masterp_tall.Rds"))),
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
# if(grepl("ufhpc", nodename)) {
#   print("I know I am on the HiPerGator!")
#   library(clustermq)
#   options(clustermq.scheduler = "slurm", clustermq.template = "slurm_clustermq.tmpl")
#   ## Run the pipeline parallelized for HiPerGator
#   make(all,
#        force = TRUE,
#        cache = cache,
#        cache_log_file = here::here("analysis", "drake", "cache_log.txt"),
#        verbose = 2,
#        parallelism = "clustermq",
#        jobs = 50,
#        caching = "master", memory_strategy = "autoclean") # Important for DBI caches!
# } else {
#   library(clustermq)
#   options(clustermq.scheduler = "multicore")
#   # Run the pipeline on multiple local cores
#   system.time(make(all, cache = cache, cache_log_file = here::here("analysis", "drake", "cache_log.txt"), parallelism = "clustermq", jobs = 2))
# }

system.time(make(sample_plan, cache = cache, cache_log_file = here::here("analysis", "drake", "cache_log.txt")))

dis <- sample_plan %>%
  dplyr::filter(substr(target, 0, 2) == "di") %>%
  dplyr::select(target) %>%
  as.matrix() %>%
  as.list()

di_dfs <- lapply(dis, FUN = function(di_name) return(readd(di_name, cache = cache, character_only = T)))

di_dfs <- dplyr::bind_rows(di_dfs) %>%
  dplyr::mutate(max_draws = max_draws)

write.csv(di_dfs, here::here("analysis", "di_dfs.csv"), row.names = F)

DBI::dbDisconnect(db)
rm(cache)
print("Completed OK")
