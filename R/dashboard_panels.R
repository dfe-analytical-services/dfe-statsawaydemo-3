dashboard_panel <- function() {
  tabPanel(
    value = "dashboard",
    "Dashboard",

    # Define UI for application that draws a histogram

    # Sidebar with a slider input for number of bins
    gov_main_layout(
      gov_row(
        column(
          width = 12,
          h1("Overall content title for this dashboard page (h1)")
        ),
        column(
          width = 12,
          div(
            class = "well",
            style = "min-height: 100%; height: 100%; overflow-y: visible",
            gov_row(
              column(
                width = 4,
                selectizeInput("area",
                  "Select a geographical area",
                  choices = choicesAreas$area_name
                )
              ),
              column(
                width = 4,
                selectizeInput(
                  inputId = "breakdown",
                  label = "Choose a breakdown:",
                  choices = list('gender', 'grade')
                )
              ),
              column(
                width = 4,
                radioGroupButtons(inputId = 'headcount_FTE',
                                  choices = list('headcount','full_time_equivalent'))
                  
                )
              ),
              column(
                width = 12,
                paste("Download the underlying data for this dashboard:"), br(),
                downloadButton(
                  outputId = "download_data",
                  label = "Download data",
                  icon = shiny::icon("download"),
                  class = "downloadButton"
                )
              )
            )
          )
        ),
        column(
          width = 12,
          tabsetPanel(
            id = "tabsetpanels",
            tabPanel(
              "Example panel 1",
              fluidRow(
                column(
                  width = 12,
                  h2("Outputs 1 (h2)"),
                    width = 12,
                    plotlyOutput("lineRevBal")
                )
              )
            ),
            tabPanel(
              "Table",
              fluidRow(
                column(
                  width = 12,
                  h2("Teachers by characteristic"),
                  p("Choose a geohraphical area, breakdown and indicator (headcount or FTE)."),
                  column(
                    width = 12,
                    dataTableOutput("tabBenchmark")
                  )
                )
              )
            )
          )
        )
        # add box to show user input
      )
    )
  
}
