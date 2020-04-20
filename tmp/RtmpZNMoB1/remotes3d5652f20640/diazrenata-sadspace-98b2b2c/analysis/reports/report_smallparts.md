SAD space report
================

Here is the range of S and N space covered:

![](report_smallparts_files/figure-markdown_github/plot%20sn%20space-1.png)![](report_smallparts_files/figure-markdown_github/plot%20sn%20space-2.png)

Things are generally easier to see on the log axis, so let's stick with that.

Size and unique elements from FS
--------------------------------

Here is how the size of the feasible set varies with S, N, and N/S:

![](report_smallparts_files/figure-markdown_github/plot%20size%20of%20fs%201-1.png)

This is *on a log scale*, so up in that right corner is *1.942426e+130*.

For now I am interested in lognparts up to about 20

![](report_smallparts_files/figure-markdown_github/nparts%20up%20to%2012-1.png)![](report_smallparts_files/figure-markdown_github/nparts%20up%20to%2012-2.png)

These are the communities we'll pull out:

![](report_smallparts_files/figure-markdown_github/plot%20focal%20communities-1.png)

    ## Warning in bind_rows_(x, .id): Unequal factor levels: coercing to character

    ## Warning in bind_rows_(x, .id): binding character and factor vector, coercing
    ## into character vector

    ## Warning in bind_rows_(x, .id): binding character and factor vector, coercing
    ## into character vector

    ## Warning in bind_rows_(x, .id): binding character and factor vector, coercing
    ## into character vector

    ## Warning in bind_rows_(x, .id): Unequal factor levels: coercing to character

    ## Warning in bind_rows_(x, .id): binding character and factor vector, coercing
    ## into character vector

    ## Warning in bind_rows_(x, .id): binding character and factor vector, coercing
    ## into character vector

    ## Warning in bind_rows_(x, .id): binding character and factor vector, coercing
    ## into character vector

    ## Warning in bind_rows_(x, .id): binding character and factor vector, coercing
    ## into character vector

    ## Warning in bind_rows_(x, .id): binding character and factor vector, coercing
    ## into character vector

    ## Warning in bind_rows_(x, .id): binding character and factor vector, coercing
    ## into character vector

    ## Warning in bind_rows_(x, .id): binding character and factor vector, coercing
    ## into character vector

    ## Warning in bind_rows_(x, .id): binding character and factor vector, coercing
    ## into character vector

    ## Warning in bind_rows_(x, .id): binding character and factor vector, coercing
    ## into character vector

    ## Warning in bind_rows_(x, .id): binding character and factor vector, coercing
    ## into character vector

    ## Warning in bind_rows_(x, .id): binding character and factor vector, coercing
    ## into character vector

    ## Warning in bind_rows_(x, .id): binding character and factor vector, coercing
    ## into character vector

    ## Warning in bind_rows_(x, .id): binding character and factor vector, coercing
    ## into character vector

    ## Warning in bind_rows_(x, .id): binding character and factor vector, coercing
    ## into character vector

    ## Warning in bind_rows_(x, .id): binding character and factor vector, coercing
    ## into character vector

Here are the FS of those distributions:

![](report_smallparts_files/figure-markdown_github/all%20fs-1.png)

Here are histograms of skew/even for these distributions:

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

![](report_smallparts_files/figure-markdown_github/hists-1.png)

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

![](report_smallparts_files/figure-markdown_github/hists-2.png)
