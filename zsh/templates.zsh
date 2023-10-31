
function template() {
  FILENAME=$1

  if [[ $# -eq 0 ]]; then
    echo "Usage: template [template_name ...]"
    return 1
  fi

  for FILENAME in $@
  do
    if [[ ! -f "${HOME}/.config/templates/${FILENAME}" ]]; then
      echo "Template '$FILENAME' not found"
      return 1
    fi

    echo "Copying '${FILENAME}' to '${PWD}/'"
    cp "${HOME}/.config/templates/${FILENAME}" "${PWD}"/
  done

}
