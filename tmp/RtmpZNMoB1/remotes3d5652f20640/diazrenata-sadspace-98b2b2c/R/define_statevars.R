#' Define statevars combinations
#'
#' @param s_range Range of S. Must be all positive numbers.
#' @param n_range Range of N. Must be all positive numbers. Max of n_range must > min of s_range.
#' @param logs are s and n ranges logs?
#' @param by by
#'
#' @return df of all allowable s and n combinations
#' @export
#'
define_statevars <- function(s_range = c(0, 6.5), n_range = c(0, 10.5), logs = TRUE, by = .5) {

  s_seq = seq(s_range[1], s_range[2], by = by)
  n_seq = seq(n_range[1], n_range[2], by = by)

  sv = expand.grid(s0 = s_seq, n0= n_seq)

  sv = sv[ which(sv$n0 > sv$s0), ]

  sv = sv[ which(sv$s0 > 0), ]

  if(logs) {
    sv <- exp(sv)
  }
  sv <- ceiling(sv)

  return(sv)

}

#' Assign p table
#'
#' @param sv df of s and n vals
#'
#' @return sv + column for which p table to use
#' @export
#'
assign_ptable <- function(sv) {

  talldim <- c(200, 40720) # 1
  widedim <- c(910, 3510) # 2
  mammdim <- c(62, 10100) # 3

  sv$p_table <- NA

  for(i in 1:nrow(sv)) {
    if(sv$s0[i] <= mammdim[1] && sv$n0[i] <= mammdim[2]) {
      sv$p_table[i] <- "mamm"
    } else if(sv$s0[i] <= widedim[1] && sv$n0[i] <= widedim[2]) {
      sv$p_table[i] <- "wide"
    } else if(sv$s0[i] <= talldim[1] && sv$n0[i] <= talldim[2]) {
      sv$p_table[i] <- "tall"
    } else {
      sv$p_table[i] <- "none"
    }
  }

  sv$p_table <- factor(sv$p_table, levels = c("none", "tall", "wide", "mamm"))

  return(sv)

}
