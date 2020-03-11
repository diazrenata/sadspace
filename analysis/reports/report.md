SAD space report
================

Here is the range of S and N space covered, and nparts in FS:

![](report_files/figure-markdown_github/plot%20sn%20space-1.png)

This is *on a log scale*, so up in that right corner is *1.942426e+130*.

![](report_files/figure-markdown_github/plot%20size%20of%20fs%202-1.png)

Note that the number of elements *would* continue to increase along each of these lines, except we hit the edge of the sampling space.

Here is the number of unique FS found, and the number of unique FS over the number that exist. Note that the number of draws was 5,000, so the maximum possible log(nunique) would be `8.5171932`. FS that found 5,000 unique draws are covered with black dots in this plot:

![](report_files/figure-markdown_github/nunique%201-1.png)

Here is the number of unique samples found relative to the number possible. FS that found all the elements possible are covered with green dots:

![](report_files/figure-markdown_github/nunique%202-1.png)

Skewness behavior
-----------------

Both skewness and the variability in skewness decrease with N/S, and increase with S. For a given S, a higher N/S (so higher N) will have lower skew and lower variability.

I don't think it matters very much whether you look at mean or median/range or sd.

![](report_files/figure-markdown_github/skewness-1.png)![](report_files/figure-markdown_github/skewness-2.png)![](report_files/figure-markdown_github/skewness-3.png)![](report_files/figure-markdown_github/skewness-4.png)![](report_files/figure-markdown_github/skewness-5.png)![](report_files/figure-markdown_github/skewness-6.png)

Simpson behavior
----------------

![](report_files/figure-markdown_github/simpson-1.png)![](report_files/figure-markdown_github/simpson-2.png)![](report_files/figure-markdown_github/simpson-3.png)![](report_files/figure-markdown_github/simpson-4.png)![](report_files/figure-markdown_github/simpson-5.png)![](report_files/figure-markdown_github/simpson-6.png)

Overlap with datasets represented in `scadsanalysis`
----------------------------------------------------

![](report_files/figure-markdown_github/scadsanalysis-1.png)

the sharpness of the threshold is an artifact of the way we don't have a lot of low s/high n communities in the datasets we started with.
