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

Both skewness and the variability in skewness decrease with N/S, and increase with S. For a given S, a higher N/S (so higher N) will have lower skew and lower variability.

I don't think it matters very much whether you look at mean or median/range or sd.

![](report_files/figure-markdown_github/skewness-1.png)![](report_files/figure-markdown_github/skewness-2.png)![](report_files/figure-markdown_github/skewness-3.png)![](report_files/figure-markdown_github/skewness-4.png)![](report_files/figure-markdown_github/skewness-5.png)![](report_files/figure-markdown_github/skewness-6.png)![](report_files/figure-markdown_github/skewness-7.png)![](report_files/figure-markdown_github/skewness-8.png)

This behavior is a little hard to understand - why should high N communities have *lower* skew? Let's look more closely at a few communities.

These are the communities we'll pull out:

![](report_files/figure-markdown_github/plot%20focal%20communities-1.png)

![](report_files/figure-markdown_github/focal%20heatmaps-1.png)![](report_files/figure-markdown_github/focal%20heatmaps-2.png)![](report_files/figure-markdown_github/focal%20heatmaps-3.png)![](report_files/figure-markdown_github/focal%20heatmaps-4.png)![](report_files/figure-markdown_github/focal%20heatmaps-5.png)![](report_files/figure-markdown_github/focal%20heatmaps-6.png)![](report_files/figure-markdown_github/focal%20heatmaps-7.png)

It looks like

-   Skewness depends largely on S. Higher S creates the possibility of having higher skew values. N doesn't change too much. I suspect that increasing N increases the abundance of not-the-most-skewed vectors, which is why the means and variability are lower.
-   Within a FS, skewness broadly tracks intuition.

So, I wouldn't interpret too heavily from skewness values from distributions with vastly different S and N.

Simpson behavior
----------------

Simpson is generally higher as S increases; it doesn't seem to change too much with N on top of the S change - if anything, it decreases with N for a given S. Variability is high for low S.

![](report_files/figure-markdown_github/simpson-1.png)![](report_files/figure-markdown_github/simpson-2.png)![](report_files/figure-markdown_github/simpson-3.png)![](report_files/figure-markdown_github/simpson-4.png)![](report_files/figure-markdown_github/simpson-5.png)![](report_files/figure-markdown_github/simpson-6.png)![](report_files/figure-markdown_github/simpson-7.png)![](report_files/figure-markdown_github/simpson-8.png)

Let's look at those same heatmaps for Simpson's:

![](report_files/figure-markdown_github/simpson%20hm-1.png)![](report_files/figure-markdown_github/simpson%20hm-2.png)![](report_files/figure-markdown_github/simpson%20hm-3.png)![](report_files/figure-markdown_github/simpson%20hm-4.png)![](report_files/figure-markdown_github/simpson%20hm-5.png)![](report_files/figure-markdown_github/simpson%20hm-6.png)![](report_files/figure-markdown_github/simpson%20hm-7.png)

Simpson gets EXTREMELY HIGH for large S and to a lesser extent large N communities.

Simpson for different S and N, and especially different S, are NOT COMPARABLE.

Distributions of skewness and simpson w nsamples
------------------------------------------------

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

![](report_files/figure-markdown_github/dists-1.png)

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

![](report_files/figure-markdown_github/dists-2.png)

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

![](report_files/figure-markdown_github/dists-3.png)

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

![](report_files/figure-markdown_github/dists-4.png)

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

![](report_files/figure-markdown_github/dists-5.png)

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

![](report_files/figure-markdown_github/dists-6.png)

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

![](report_files/figure-markdown_github/dists-7.png)

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

    ## Warning: Removed 4 rows containing missing values (geom_bar).

![](report_files/figure-markdown_github/dists-8.png)

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

    ## Warning: Removed 4 rows containing missing values (geom_bar).

![](report_files/figure-markdown_github/dists-9.png)

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

    ## Warning: Removed 4 rows containing missing values (geom_bar).

![](report_files/figure-markdown_github/dists-10.png)

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

    ## Warning: Removed 4 rows containing missing values (geom_bar).

![](report_files/figure-markdown_github/dists-11.png)

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

    ## Warning: Removed 4 rows containing missing values (geom_bar).

![](report_files/figure-markdown_github/dists-12.png)

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

    ## Warning: Removed 4 rows containing missing values (geom_bar).

![](report_files/figure-markdown_github/dists-13.png)

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

    ## Warning: Removed 4 rows containing missing values (geom_bar).

![](report_files/figure-markdown_github/dists-14.png) OK, I feel good that the sim index is unrelated to the value, and that increasing the nb of sims only increases resolution, not shape.
