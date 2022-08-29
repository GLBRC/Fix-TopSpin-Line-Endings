#! /bin/bash

# This script takes a path which contains the listed files and it will change the newline ending characters to match the windows CLRF format.

# Script requires one argument.
# $1 = FOLDER_NAME - (Required) This points to the folder which contains the files to be updated.

if [ -z ${1+x} ]; then
  echo "Must provide a path."
  exit 1
fi

ROOT_FOLDER=${1}
FILES_TO_FIX=("acqu" "acqus" "pdata/1/proc" "pdata/1/procs")

echo "Beginning conversion of ${ROOT_FOLDER}…"

for f in "${FILES_TO_FIX[@]}"; do
  source_file=${ROOT_FOLDER}/${f}
  tmp_file=${source_file}.tmp

  echo "Now converting '${source_file}'"

  perl -pe 's/\r\n|\n|\r/\r\n/g' "${source_file}" > "${tmp_file}"
  mv "${tmp_file}" "${source_file}"

  echo "Done!"
done

echo "Conversion of '${ROOT_FOLDER}' complete!"
