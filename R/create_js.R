#' Title Create template JS file.
#'
#' @param filepath Where to create base js file.
#' @param overwrite Should we overwrite any file named 'my_js.js' in the filepath?
#'
#' @return CSS file created in filepath.
#'
#' @examples \dontrun
create_js_file = function(
    filepath = './',
    overwrite = F){

  js_file_path <- "www/my_js.js"  # Replace with the desired file path

  if(!file.exists(paste0('./',js_file_path)) | overwrite){

    # Define the javascript content
    js_content <- "my_button = document.getElementById('make_alert');

    my_button.addEventListener('click', function() {
      alert('Hello!')
    })"
# Create and write to the CSS file
file.create(js_file_path)  # Create the file (if it doesn't exist)
writeLines(js_content, js_file_path)  # Write the CSS content to the file
  }
}
