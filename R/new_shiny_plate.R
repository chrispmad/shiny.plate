#' Title Create a shiny template with separate CSS and JS files.
#'
#' @param filepath Where to create the new shiny template.
#' @param overwrite Should we overwrite any files in the filepath?
#'
#' @return Shiny template with CSS and JS embedded.
#' @export
#'
#' @examples \dontrun
new_shiny_plate = function(
    filepath = NULL,
    new_project = T,
    overwrite = T){

  if(is.null(filepath)) stop("Filepath must not be empty.")

  # New project name.
  proj_name = stringr::str_remove_all(filepath, '.*/')

  if(new_project){
    rstudioapi::initializeProject(path = filepath)
  }

  setwd(filepath)

  if(!dir.exists('app')) dir.create('app')

  setwd('app/')

  if(!dir.exists('www')) dir.create('www')

  create_shiny_pages(
    filepath = filepath,
    overwrite = overwrite
  )

  create_js_file(
    filepath = filepath,
    overwrite = overwrite
  )

  create_css_file(
    filepath = filepath,
    overwrite = overwrite
  )

  # Ask user if we should switch to the new project in RStudio.
  cat(paste0("Switch to new project ",proj_name,"? [y/n]\n"))

  user_switch_proj = readline("[y/n] ")

  if(user_switch_proj %in% c('y','Y')){
    cat(paste0("Switching to new shiny template ",proj_name))
  rstudioapi::openProject(path = filepath)
  } else {
    cat(paste0("Finished creating new shiny template ",proj_name,"!"))
  }
}
