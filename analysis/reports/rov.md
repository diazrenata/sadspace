Range of variation
================

Ambitious heatmaps of ROV:

``` r
di_dfs_comparable <- di_dfs %>%
  filter(nunique >= 500)

subsampled_dfs <- list()
for(i in 1:length(unique(di_dfs_comparable$community_name))) {
  subsampled_dfs[[i]] <- filter(di_dfs, community_name == unique(di_dfs_comparable$community_name)[i])
  
  sim_options <- unique(subsampled_dfs[[i]]$sim)
  
  sim_options <- sim_options[1:min(length(sim_options), 500)]
  
  subsampled_dfs[[i]] <- filter(subsampled_dfs[[i]], sim %in% sim_options)
  
}

subsampled_dfs <- bind_rows(subsampled_dfs)


ggplot(subsampled_dfs, aes(x = simpson, group = community_name, color = lognparts, linetype = more_than_10)) +
  geom_density(alpha = 0, size = .5) +
  theme_bw() +
  #facet_wrap(vars(more_than_10)) +
  scale_color_viridis_c(end = .95, direction = -1)
```

![](rov_files/figure-markdown_github/rov%20heatmaps-1.png)

``` r
ggplot(subsampled_dfs, aes(x = skew, group = community_name, color = lognparts, linetype = more_than_10)) +
  geom_density(alpha = 0, size = .5) +
  theme_bw() +
  #facet_wrap(vars(more_than_10)) +
  scale_color_viridis_c(end = .95, direction = -1)
```

    ## Warning: Removed 2 rows containing non-finite values (stat_density).

![](rov_files/figure-markdown_github/rov%20heatmaps-2.png)
