#!/bin/sh

# This init script install various useful VScode extensions
# NB : only extensions from the Open VSX Registry (https://open-vsx.org/) can be installed on code-server
# Expected parameters : None

# CONFORT EXTENSIONS -----------------

code-server --install-extension ms-toolsai.jupyter
code-server --install-extension ms-python.python
code-server --install-extension charliermarsh.ruff
code-server --install-extension aaron-bond.better-comments
code-server --install-extension ms-toolsai.datawrangler
code-server --install-extension GitHub.copilot
code-server --install-extension GitHub.copilot-chat


