
function template() {
  FILENAME=$1

  if [[ -z ${FILENAME} ]]; then
    echo "Usage: template TEMPLATE_NAME"
    return 1
  fi

  if [[ ! -f "${HOME}/.config/templates/${FILENAME}" ]]; then
    echo "Template '$FILENAME' not found"
    return 1
  fi

  echo "Copying '${FILENAME}' to '${PWD}/'"
  cp "${HOME}/.config/templates/${FILENAME}" "${PWD}"/
}
