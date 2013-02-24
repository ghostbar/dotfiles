# Change file extensions recursively in current directory
#
# first   - current extension
# second  - future extension
# 
# Example
# 
#   change-extension erb haml
#   % => NULL

function change-extension() {
  foreach f (**/*.$1)
    mv $f $f:r.$2
  end
}
