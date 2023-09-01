
PNPM_HOME="/Users/lollo/Library/pnpm"

if [[ -d $PNPM_HOME ]]; then
  export PNPM_HOME=$PNPM_HOME
  case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
  esac
fi

