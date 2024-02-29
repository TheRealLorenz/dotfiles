
function template() {
  if [[ $# -eq 0 ]]; then
    echo "Usage: template [template_name ...]"
    return 1
  fi

  for FILENAME in $@
  do
    PARTS=(${(@s:#:)FILENAME})

    DEST=${PARTS[1]}

    if [[ -z ${DEST} ]]; then
        DEST=${FILENAME}
    fi

    if [[ ! -f "${HOME}/.config/templates/${FILENAME}" ]]; then
      echo "Template '$FILENAME' not found"
      return 1
    fi

    echo "Copying '${FILENAME}' to '${PWD}/${DEST}'"
    cp "${HOME}/.config/templates/${FILENAME}" "${PWD}"/"${DEST}"
  done

}
