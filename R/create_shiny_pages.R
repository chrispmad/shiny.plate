#' Title Create the shiny scripts (R scripts) for shiny template
#'
#' @param filepath Where to create the new shiny template.
#' @param overwrite Should we overwrite any files in the filepath?
#'
#' @return Shiny R files created.
#'
#' @examples \dontrun
create_shiny_pages = function(
    filepath = './',
    overwrite = F){

    server_file_path <- "server.R"
    ui_file_path <- "ui.R"
    app_file_path <- "app.R"

    if(!file.exists(paste0('./',app_file_path)) | overwrite){

      # Define the shiny pages' content
      server_content <- "
library(shiny)
library(bslib)
library(tidyverse)

server <- function(input, output, session) {

  my_data = reactive({
    req(input$min_petal_width)
    iris |>
      filter(Petal.Width >= input$min_petal_width)
  })

  colour_options = RColorBrewer::brewer.pal(10, 'Spectral')

  selected_colour = reactiveVal(sample(colour_options, 1))

  observeEvent(input$reroll_colour, {
    selected_colour(sample(colour_options, 1))
  })

  output$my_plot = renderPlot({
    print(selected_colour())
    ggplot(my_data()) +
      geom_point(aes(x = Sepal.Width,
                     y = Sepal.Length),
                 col = selected_colour())
  })
}
"

    ui_content <- "
library(shiny)
library(bslib)

sidebar = sidebar(
  sliderInput('min_petal_width',
              'Min Petal Width',
              min = 0,
              max = max(iris$Petal.Width),
              value = max(iris$Petal.Width/2)),
  actionButton('reroll_colour',
               'Random Colour'),
  actionButton('make_alert',
               'Popup!')
)

main = tagList(
  plotOutput('my_plot')
)

ui = page_sidebar(
  includeCSS('www/my_style.css'),
  includeScript('www/my_js.js'),
  sidebar = sidebar,
  main
)
"

    app_content <- "
source('server.R')
source('ui.R')

shinyApp(ui, server)
"

      # Create files and write to them.
      file.create(server_file_path)
      file.create(ui_file_path)
      file.create(app_file_path)

      writeLines(server_content, server_file_path)
      writeLines(ui_content, ui_file_path)
      writeLines(app_content, app_file_path)
    }
  }
