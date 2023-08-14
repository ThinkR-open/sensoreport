#' params UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_params_ui <- function(id){

  ns <- NS(id)

  tagList(
    tags$div(
      class = "col-xs-12 col-sm-4",

      tags$div(
        class = "form",
        accordion(
          id = "form-accordion",
          items = tagList(

            accordion_item(
              accordion_id = "form-accordion",
              item_id = "author",
              item_header = "Author of the sensory report",
              button_id = "authorButton",
              open = TRUE,
              textInput(
                inputId = ns("firstname"),
                label = "First name",
                placeholder = "John",
                width = "100%"
              ) |>
                tagAppendAttributes(class = "form-control-sm"),
              textInput(
                inputId = ns("lastname"),
                label = "Last name",
                placeholder = "Doe",
                width = "100%"
              ) |>
                tagAppendAttributes(class = "form-control-sm")
            ),

            accordion_item(
              accordion_id = "form-accordion",
              item_id = "session",
              item_header = "Session",
              button_id = "sessionButton",
              open = FALSE,
              selectInput(
                inputId = ns("session"),
                label = NULL,
                choices = NULL
              ) |>
                tagAppendAttributes(class = "form-control-sm"),
            ),

            accordion_item(
              accordion_id = "form-accordion",
              item_id = "products",
              item_header = "Products",
              button_id = "productsButton",
              open = FALSE,
              checkboxGroupInput(
                inputId = ns("products"),
                label = NULL,
                choices = NULL
              ) |>
                tagAppendAttributes(class = "form-control-sm"),
            )


          )
        )
      ),

      br(),

      actionButton(
        inputId = ns("run"),
        class = "btn-secondary",
        icon = icon("gears"),
        label = "Run the report",
        width = "100%"
      ),

      downloadButton(
        outputId = ns("download"),
        class = "btn-secondary",
        icon = icon("download"),
        label = "Download the report"
      )

    )
  )
}

#' params Server Functions
#'
#' @importFrom dplyr tbl sql distinct pull
#' @importFrom glue glue
#' @noRd
mod_params_server <- function(id, r_global){

  moduleServer( id, function(input, output, session){

    ns <- session$ns

    observeEvent(NULL, ignoreNULL = FALSE, ignoreInit = FALSE, once = TRUE, priority = 1, {
      golem::invoke_js("disable", glue("#{ns('run')}"))
      golem::invoke_js("hide", glue("#{ns('download')}"))
    })

    # Get all available sessions
    observe({

      con_db <- connect_db()

      all_sessions <- tbl(con_db, sql("SELECT * FROM SESSIONS")) |>
        distinct(SESSION) |>
        pull()

      updateSelectInput(
        inputId = "session",
        label = NULL,
        choices = all_sessions,
        selected = NA
      )

      DBI::dbDisconnect(con_db)

    })

    # Get all products in a session
    observeEvent(
      input$session,
      ignoreInit = TRUE, {

        con_db <- connect_db()

      all_products_in_session <- tbl(con_db, sql(glue("SELECT * FROM SENSORY WHERE SESSION IS '{input$session}'"))) |>
        distinct(PRODUCT) |>
        pull()

      updateCheckboxGroupInput(
        inputId = "products",
        label = NULL,
        choices = all_products_in_session,
        selected = all_products_in_session,
        inline = TRUE
      )

      DBI::dbDisconnect(con_db)

      golem::invoke_js("reable", glue("#{ns('run')}"))

    })

    # Get the name of the author
    observeEvent(
      c(input$firstname, input$lastname),
      ignoreInit = TRUE, {

        firstname <- input$firstname
        lastname <- input$lastname
        r_global$author <- paste(firstname, lastname)

      }
    )

    # Get the session to be included into the report
    observeEvent(
      input$session,
      ignoreInit = TRUE, {

        r_global$session <- input$session

      }
    )

    # Get the products to be included into the report
    observeEvent(
      input$products,
      ignoreInit = TRUE, {

        r_global$products <- input$products

      }
    )

    # Run the analysis
    observeEvent(
      input$run,
      ignoreInit = TRUE, {

        # Create a temporary directory
        my_temp_dir <- tempfile()
        dir.create(my_temp_dir)

        # Create the sensory report
        res_info_report <- create_report(
          author = r_global$author,
          session = r_global$session,
          products = r_global$products,
          output_dir = my_temp_dir
        )

        # Save the info about the report
        r_global$report_dir <- res_info_report$output_dir_report
        r_global$report_file <- res_info_report$output_file_report

        golem::invoke_js("show", glue("#{ns('download')}"))

        # Prepare to download the report
        output$download <- downloadHandler(

          filename = function() {
            r_global$report_file
          },

          content = function(file) {

            req(r_global$report_file)

            message("download:", file)

            file.copy(
              from = file.path(r_global$report_dir, r_global$report_file),
              to = file
            )

          }
        )

      }
    )

  })
}

## To be copied in the UI
# mod_params_ui("params_1")

## To be copied in the server
# mod_params_server("params_1")
