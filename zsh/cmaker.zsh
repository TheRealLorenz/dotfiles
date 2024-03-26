
RESET='\x1b[0m'
RED='\x1b[31m'
GREEN='\x1b[32m'
BOLD='\x1b[1m'

CMAKE_DEBUG_DIR='cmake-build-debug'
CMAKE_RELEASE_DIR='cmake-build-release'

cmaker() {
  local flag_verbose
  local flag_type
  local flag_yes
  local type
  local dir
  local yes

  zmodload zsh/zutil
  zparseopts -D -F -K -E -- \
    {v,-verbose}=flag_verbose \
    {d,-debug}=flag_type \
    {r,-release}=flag_type \
    {y,-yes}=flag_yes ||
    return 1

  yes=$#flag_yes

  if [[ -z $flag_type ]]; then
    echo "Type not specified, defaulting to debug"
    type='Debug'
    dir=${CMAKE_DEBUG_DIR}
  elif [[ $flag_type == "-r" || $flag_type == "--release" ]]; then
    type='Release'
    dir=${CMAKE_RELEASE_DIR}
  elif [[ $flag_type == "-d" || $flag_type == "--debug" ]]; then
    type='Debug'
    dir=${CMAKE_DEBUG_DIR}
  else
    "Unreachable"
    return 1
  fi

  if [[ "$1" == "reload" ]]; then
    cmaker_reload $type $dir
  elif [[ "$1" == "build" ]]; then
    cmaker_build $type $dir
  elif [[ "$1" == "clean" ]]; then
    cmaker_clean $type $dir $yes
  else
    echo "Invalid option '$1'"
    return 1
  fi
}

cmaker_reload() {
  local type=${1:?'Missing parameter for CMAKE_BUILD_TYPE'}
  local dir=${2:?'Missing build folder parameter'}

  run_task "cmake -S . -B $dir -DCMAKE_BUILD_TYPE=$type" "Reloading CMake project: $type"
}

cmaker_build() {
  local type=${1:?'Missing parameter for CMAKE_BUILD_TYPE'}
  local dir=${2:?'Missing build folder parameter'}

  run_task "cmake --build $dir" "Building CMake project: $type"
}

cmaker_clean() {
  local type=${1:?'Missing parameter for CMAKE_BUILD_TYPE'}
  local dir=${2:?'Missing build folder parameter'}
  local yes=$3

  [[ $yes -ne 0 ]] || gum confirm "Are you sure to delete folder $dir?" \
      && run_task "rm -rf $dir" "Deleting $dir" \
      || echo "Cancelled"
}

run_task() {
  TITLE=${2:-Loading}
  OUTPUT=$(GUM_SPIN_TITLE=" $TITLE..." gum spin --show-output -- bash -c "$1 2>&1")
  EXIT_CODE=$?

  if [[ $EXIT_CODE -eq 0 ]]; then
    echo "$GREEN$BOLD✓$RESET $TITLE"
    return 0
  fi

  echo "$RED$BOLD✘$RESET $TITLE"
  echo $OUTPUT | sed 's/^/  /g'
  return $EXIT_CODE
}

