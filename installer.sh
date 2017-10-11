#!/usr/bin/sh
git clone https://github.com/guiferpa/aterminal.git aterminal
rm -rf $ZSH/plugins/aterminal
mv aterminal $ZSH/plugins/aterminal