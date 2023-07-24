#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {

  # Create a global reactivevalue
  r_global <- reactiveValues()

  # Your application server logic
  mod_params_server("mod_params", r_global = r_global)
  mod_report_server("mod_report", r_global = r_global)

}
