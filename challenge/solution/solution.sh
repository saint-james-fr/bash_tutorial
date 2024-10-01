#!/bin/bash

# Directories to search in
COMPONENTS_DIR="./components"
PAGES_DIR="./pages"
APP_VUE_FILE="./App.vue"

mkdir -p ./tmp
# Temporary file to store unused components
UNUSED_COMPONENTS="./tmp/unused_components.txt"

# Clear previous output file
>"$UNUSED_COMPONENTS"

# Find all .vue component files in the components folder
COMPONENT_FILES=$(find "$COMPONENTS_DIR" -type f -name '*.vue')

echo "Checking for unused components..."

# Iterate through each component file
for COMPONENT_PATH in $COMPONENT_FILES; do
  # Get the base name of the component file (without extension)
  COMPONENT_NAME=$(basename "$COMPONENT_PATH" .vue)

  # Search for the component name inside components and pages folders
  FOUND=$(grep -R "<$COMPONENT_NAME" "$COMPONENTS_DIR" "$PAGES_DIR" "$APP_VUE_FILE")

  # If the component is not found, add it to the unused list
  if [ -z "$FOUND" ]; then
    echo "$COMPONENT_NAME" >>"$UNUSED_COMPONENTS"
  fi
done

# Display unused components if found
if [ -s "$UNUSED_COMPONENTS" ]; then
  echo "Unused components found and listed in $UNUSED_COMPONENTS"
  cat "$UNUSED_COMPONENTS"
else
  echo "No unused components found!"
fi

# clean unused components
rm -f "$UNUSED_COMPONENTS"