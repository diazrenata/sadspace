SAD space report
================

Here is the range of S and N space covered:

![](report_files/figure-markdown_github/plot%20sn%20space-1.png)![](report_files/figure-markdown_github/plot%20sn%20space-2.png)

Things are generally easier to see on the log axis, so let's stick with that.

Size and unique elements from FS
--------------------------------

Here is how the size of the feasible set varies with S, N, and N/S:

![](report_files/figure-markdown_github/plot%20size%20of%20fs%201-1.png)

This is *on a log scale*, so up in that right corner is *1.942426e+130*.

![](report_files/figure-markdown_github/plot%20size%20of%20fs%202-1.png)![](report_files/figure-markdown_github/plot%20size%20of%20fs%202-2.png)![](report_files/figure-markdown_github/plot%20size%20of%20fs%202-3.png)![](report_files/figure-markdown_github/plot%20size%20of%20fs%202-4.png)![](report_files/figure-markdown_github/plot%20size%20of%20fs%202-5.png)![](report_files/figure-markdown_github/plot%20size%20of%20fs%202-6.png)![](report_files/figure-markdown_github/plot%20size%20of%20fs%202-7.png)![](report_files/figure-markdown_github/plot%20size%20of%20fs%202-8.png)

Note that the number of elements *would* continue to increase, except we hit the edge of the sampling space.

Here is the number of unique FS found, and the number of unique FS over the number that exist. Note that the number of draws was 10,000, so the maximum possible log(nunique) would be 9.2. FS that found 10,000 unique draws are covered with black dots in this plot:

![](report_files/figure-markdown_github/nunique%201-1.png)

Here is the number of unique samples found relative to the number possible. FS that found all the elements possible are covered with green dots:

![](report_files/figure-markdown_github/nunique%202-1.png)![](report_files/figure-markdown_github/nunique%202-2.png)

Skewness behavior
-----------------

<!-- ```{r summary df} -->
<!-- di_summary_df <- di_df %>% -->
<!--   group_by(s0, n0, nparts, nunique) %>% -->
<!--   summarize(mean_skew = mean(skew, na.rm = T), -->
<!--             sd_skew = sd(skew, na.rm = T), -->
<!--             range_skew = max(skew, na.rm = T) - min(skew, na.rm = T), -->
<!--             median_skew = median(skew, na.rm = T), -->
<!--             median_simpson = median(simpson, na.rm = T), -->
<!--             mean_simpson = mean(simpson, na.rm = T), -->
<!--             sd_simpson = sd(simpson, na.rm = T), -->
<!--             range_simpson = max(simpson, na.rm = T) - min(simpson, na.rm = T)) %>% -->
<!--   ungroup() %>% -->
<!--   mutate(log_nunique = log(nunique), -->
<!--          log_nparts = log(as.numeric(nparts))) -->
<!-- ``` -->
![](report_files/figure-markdown_github/skewness-1.png)![](report_files/figure-markdown_github/skewness-2.png)![](report_files/figure-markdown_github/skewness-3.png)![](report_files/figure-markdown_github/skewness-4.png)![](report_files/figure-markdown_github/skewness-5.png)![](report_files/figure-markdown_github/skewness-6.png)![](report_files/figure-markdown_github/skewness-7.png)![](report_files/figure-markdown_github/skewness-8.png)

Simpson behavior
----------------

![](report_files/figure-markdown_github/simpson-1.png)![](report_files/figure-markdown_github/simpson-2.png)![](report_files/figure-markdown_github/simpson-3.png)![](report_files/figure-markdown_github/simpson-4.png)![](report_files/figure-markdown_github/simpson-5.png)![](report_files/figure-markdown_github/simpson-6.png)![](report_files/figure-markdown_github/simpson-7.png)![](report_files/figure-markdown_github/simpson-8.png)
