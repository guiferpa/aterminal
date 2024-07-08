#!/usr/bin/sh
git clone https://github.com/guiferpa/aterminal.git aterminal
rm -rf $ZSH/themes/aterminal
mv aterminal $ZSH/themes/aterminal
