#' report UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_report_ui <- function(id){

  ns <- NS(id)

  tagList(
    tags$div(
      class = "col-8",
      tags$div(
        htmlOutput(ns("report"))
      )
    )
  )

}

#' report Server Functions
#'
#' @noRd
mod_report_server <- function(id, r_global){

  moduleServer(id, function(input, output, session){

    ns <- session$ns

    # Preview the report
    observeEvent(
      c(
        r_global$report_dir,
        r_global$report_file
      ), {

        add_resource_path(
          "reportlibrary", r_global$report_dir
        )

        output$report <- renderUI({
          tagList(
            tags$div(
              style = "padding-top: 1em;",
              tags$iframe(
                seamless = "seamless",
                src = paste0("reportlibrary/", r_global$report_file),
                frameborder = "0",
                style = "width:100vw;height:100vh;"
                )
              )
            )
        })

      })

    })
}

## To be copied in the UI
# mod_report_ui("report_1")

## To be copied in the server
# mod_report_server("report_1")
