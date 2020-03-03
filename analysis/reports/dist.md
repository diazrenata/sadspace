SAD space report
================

Number of comparisons

    ## Warning: Removed 60 rows containing missing values (geom_point).

![](dist_files/figure-markdown_github/ncomparisons-1.png)![](dist_files/figure-markdown_github/ncomparisons-2.png)![](dist_files/figure-markdown_github/ncomparisons-3.png)

The region of interest is down where lognparts &lt; 10. These FS also have fewer comparisons (because they are smaller). We will look at results summarized from all comparisons and from subsampled to an equal, small number of comparisons for all communities. We can use the subsampled diffs to look at density plots, etc as well.

All comparisons:

![](dist_files/figure-markdown_github/all%20comparisons%20diff%20means-1.png)![](dist_files/figure-markdown_github/all%20comparisons%20diff%20means-2.png)![](dist_files/figure-markdown_github/all%20comparisons%20diff%20means-3.png)![](dist_files/figure-markdown_github/all%20comparisons%20diff%20means-4.png)![](dist_files/figure-markdown_github/all%20comparisons%20diff%20means-5.png)

Not shown, but the r2 relationships (log and not) really go haywire for very low values of mean r2 and mean r2 (log). Very low meaning, r2 &lt; 0 and r2\_log &lt; -1.

    ## Warning: Removed 24 rows containing missing values (geom_point).

![](dist_files/figure-markdown_github/small%20summary%20v%20summary%20plots-1.png)

    ## Warning: Removed 17 rows containing missing values (geom_point).

![](dist_files/figure-markdown_github/small%20summary%20v%20summary%20plots-2.png)![](dist_files/figure-markdown_github/small%20summary%20v%20summary%20plots-3.png)![](dist_files/figure-markdown_github/small%20summary%20v%20summary%20plots-4.png)![](dist_files/figure-markdown_github/small%20summary%20v%20summary%20plots-5.png)

The summary stats from the subsampled comparisons are closely related to the non-subsampled comparisons, but there is motion when we subsample.

Subsampling allows us to plot the density plots for these various stats...

![](dist_files/figure-markdown_github/density%20plots%20wide-1.png)![](dist_files/figure-markdown_github/density%20plots%20wide-2.png)

![](dist_files/figure-markdown_github/density%20plots%20bounded-1.png)![](dist_files/figure-markdown_github/density%20plots%20bounded-2.png)![](dist_files/figure-markdown_github/density%20plots%20bounded-3.png)

-   Consider seeing if FS become more concentrated far from even (hoover)
