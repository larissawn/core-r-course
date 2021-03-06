#!/usr/bin/env Rscript
setwd(here::here())

render <- function(x) {
  cli::cat_line(x)
  if (any(grepl("slides\\.Rmd$", x))) {
    purrr::walk(x[grepl("slides\\.Rmd$", x)], rmarkdown::render)
    rmarkdown::render_site()
  } else rmarkdown::render_site()
}

rmarkdown::render_site()
servr::httw(handler = render, pattern = "\\.(R?md|yml|css)", host = "127.0.0.1")
