#!/bin/bash

INSTALL_DIR="/usr/local/bin"
SCRIPT_NAME="vman"

cp src/vman.sh $INSTALL_DIR/$SCRIPT_NAME

chmod +x $INSTALL_DIR/$SCRIPT_NAME

if ! grep -Fxq 'alias vman="source /usr/local/bin/vman"' ~/.bashrc; then
    echo 'alias vman="source /usr/local/bin/vman"' >> ~/.bashrc
fi

if ! grep -Fxq 'alias vman="source /usr/local/bin/vman"' ~/.zshrc; then
    echo 'alias vman="source /usr/local/bin/vman"' >> ~/.zshrc
fi

echo "vman installed successfully in $INSTALL_DIR"
