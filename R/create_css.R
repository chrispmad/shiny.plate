#' Title Create template CSS file.
#'
#' @param filepath Where to create base css file.
#' @param overwrite Should we overwrite any file named 'my_style.css' in the filepath?
#'
#' @return CSS file created in filepath.
#'
#' @examples \dontrun
create_css_file = function(
    filepath = './',
    overwrite = F){

  css_file_path <- "www/my_style.css"  # Replace with the desired file path

  if(!file.exists(paste0('./',css_file_path)) | overwrite){

  # Define the CSS content
  css_content <- 'body {
    background-color: pink;
    font-family: Arial, sans-serif;
}'
# Create and write to the CSS file
file.create(css_file_path)  # Create the file (if it doesn't exist)
writeLines(css_content, css_file_path)  # Write the CSS content to the file
  }
}
