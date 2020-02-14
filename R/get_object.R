#' Get something out of the cache
#'
#' @param object_name Name of what to get
#'
#' @return thing
#' @export
#' @importFrom DBI dbConnect dbDisconnect
#' @importFrom storr storr_dbi
#' @importFrom drake readd
get_object <- function(object_name) {
  ## Set up the cache and config
  db <- DBI::dbConnect(RSQLite::SQLite(), here::here("analysis", "drake", "drake-cache.sqlite"))
  cache <- storr::storr_dbi("datatable", "keystable", db)

  this_obj <- drake::readd(object_name, cache = cache, character_only = T)

  DBI::dbDisconnect(db)
  rm(cache)

  return(this_obj)
}
