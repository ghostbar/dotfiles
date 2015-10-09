# Make directory and change into it
#
# text  - directory to be created
#
# Example
#
#   mcd this-directory
#   % => $PWD = $PWD/this-directory

function mcd() {
  mkdir -p "$1" && cd "$1";
}
