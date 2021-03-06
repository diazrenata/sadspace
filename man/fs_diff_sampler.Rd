% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dist_metrics.R
\name{fs_diff_sampler}
\alias{fs_diff_sampler}
\title{Distance metrics sampler}
\usage{
fs_diff_sampler(fs_set)
}
\arguments{
\item{fs_set}{df of samples from FS}
}
\value{
df with cols for dist metrics, sim, s0, n0
}
\description{
Randomly draw two elements from FS bank; compute various distance comparisons and return summary.
}
