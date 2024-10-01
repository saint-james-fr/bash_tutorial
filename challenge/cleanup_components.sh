#!/bin/bash

# 1. Directories to search in. Use variables to stock the path

# 2. Temporary file to store unused components result. Use a variable to stock the path

# 3. Find all .vue component files in the components folder
# Use the find command. Check the option -type f and -name

# 4. Adds a message to let the user know that we are checking for unused components
# It's always nicer to let the user know that we are doing something.

# 5. Iterate through each component file
# Use a for loop to iterate through the COMPONENT_FILES variable

# 6. Use a for loop to iterate through the COMPONENT_FILES variable
# Structure of the for loop:
# for VARIABLE in $VARIABLE_TO_ITERATE; do$
#   # 1. Get the base name of the component file (without extension).
#   # You should use the command basename
#   # 2. Search for the component name inside components and pages folders
#   # You should use the command grep. Check the option -R. Syntax is:
#   # grep -R "<WHAT YOU ARE LOOKING FOR>" <PATH_TO_SEARCH>
#   # 3. If the component is not found, add it to the unused list
#   # Use the option -z to check if the variable is empty
#   # You should use the command echo
# done

# 7. Display unused components if found
# Use the option -s to check if the file is not empty and echo the result in terminal

# 8. clean unused components list
