#' mod_navbar UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_navbar_ui <- function(id) {
  ns <- NS(id)
  tagList(
    tags$nav(
      class = "navbar navbar-light bg-transparent",
      tags$a(
        class = "navbar-brand",
        href = "#",
        tags$img(
          src = "www/logo.png",
          width = "25%",
          style = "margin-left: auto; margin-right: auto"
        )
      )
    )
  )
}

#' mod_navbar Server Functions
#'
#' @importFrom bslib bs_theme_update
#'
#' @noRd
mod_navbar_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
  })
}
