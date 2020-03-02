#' Sample the feasible set
#'
#' @param s s
#' @param n n
#' @param nsamples nb samples
#' @param p_table p table
#'
#' @return long dataframe of sim, rank, and abundance
#' @export
#'
#' @importFrom dplyr mutate group_by arrange ungroup row_number bind_rows
#' @importFrom tidyr gather
#' @importFrom feasiblesads fill_ps sample_fs
sample_fs <- function(s, n, nsamples, p_table = NULL) {

  if(is.null(p_table)) {
    p_table <- feasiblesads::fill_ps(s, n, storeyn = F)
  }

  p_table <- p_table[1:s, 1:(n + 1)]

  fs_samples <- feasiblesads::sample_fs(s = s, n = n, nsamples = nsamples, p_table = p_table) %>%
    as.data.frame() %>%
    dplyr::mutate(sim = dplyr::row_number()) %>%
    dplyr::group_by_at(1:s) %>%
    dplyr::mutate(sim = min(sim)) %>%
    dplyr::ungroup() %>%
    dplyr::distinct() %>%
    tidyr::pivot_longer(cols = 1:s, names_to = "rank", values_to = "abund") %>%
    dplyr::mutate(rank = as.numeric(substr(rank, 2, nchar(rank))),
                  nparts =as.character(count_elements(s, n, p_table)),
                  s0 = s,
                  n0 = n)


  return(fs_samples)

}

#' Add diversity indices
#'
#' @param fs_samples fs df
#'
#' @return fs df summarized to dis
#' @export
#' @importFrom dplyr group_by summarize ungroup mutate
#' @importFrom e1071 skewness
#' @importFrom vegan diversity
fs_di <- function(fs_samples) {

  fs_samples <- fs_samples %>%
    dplyr::group_by(sim, nparts, s0, n0) %>%
    dplyr::summarize(
      skew = e1071::skewness(abund),
      simpson = vegan::diversity(abund, index = "simpson"),
      hoover = hoover(abund)
    ) %>%
    dplyr::ungroup() %>%
    dplyr::mutate(nunique = length(unique(sim)))

  return(fs_samples)

}

#' Hoover index
#'
#' @param abund_vect abund
#'
#' @return hoover inequality index
#' @export
#'
hoover <- function(abund_vect) {

  mean_abund = mean(abund_vect)
  total_abund = sum(abund_vect)

  errors <- sum(abs(abund_vect - mean_abund))

  .5 * (errors / total_abund)

}

