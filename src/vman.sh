#!/bin/bash

VENV_DIR="venv"
CREATE_GITIGNORE=true
ACTION="create"

while getopts "n:g" opt; do
  case $opt in
    n) VENV_DIR="$OPTARG"
    ;;
    g) CREATE_GITIGNORE=false
    ;;
    u) ACTION="update"
    ;;
    r) ACTION="remove"
    ;;
    d) ACTION="deactivate"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
        exit 1
    ;;
  esac
done

create_gitignore() {
  if [ -e ".gitignore" ]; then
    if ! grep -Fxq "$VENV_DIR/" .gitignore; then
      echo "$VENV_DIR/" >> .gitignore
      echo "Added '$VENV_DIR/' to .gitignore."
    else
      echo "'$VENV_DIR/' is already in .gitignore."
    fi
  else
    echo "$VENV_DIR/" > .gitignore
    echo "Created .gitignore and added '$VENV_DIR/'."
  fi
}

remove_venv() {
  if [ -d "$VENV_DIR" ]; then
    rm -rf "$VENV_DIR"
    echo "Virtual environment '$VENV_DIR' removed."
  else
    echo "Virtual environment '$VENV_DIR' does not exist."
  fi
}

deactivate_venv() {
  if [ -n "$VIRTUAL_ENV" ]; then
    deactivate
    echo "Virtual environment deactivated."
  else
    echo "No virtual environment is currently activated."
  fi
}

if [ "$ACTION" == "remove" ]; then
  remove_venv
  exit 0
fi

if [ "$ACTION" == "deactivate" ]; then
  deactivate_venv
  exit 0
fi

if [ -d "$VENV_DIR" ]; then
  if [ "$ACTION" == "update" ]; then
    echo "Updating virtual environment '$VENV_DIR'..."
    rm -rf "$VENV_DIR"
    python3 -m venv "$VENV_DIR"
    echo "Virtual environment '$VENV_DIR' updated."
  else
    echo "Virtual environment '$VENV_DIR' already exists. Activating..."
  fi
else
  echo "Virtual environment '$VENV_DIR' not found. Creating a new one..."
  python3 -m venv "$VENV_DIR"
  echo "Virtual environment '$VENV_DIR' created."
  if $CREATE_GITIGNORE; then
    create_gitignore
  fi
fi

source "$VENV_DIR/bin/activate"
echo "Virtual environment '$VENV_DIR' activated."
