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

# Settings personnal

# Path to the VSCode settings.json file
SETTINGS_FILE="${HOME}/.local/share/code-server/User/settings.json"

# Check if the settings.json file exists, otherwise create a new one
if [ ! -f "$SETTINGS_FILE" ]; then
    echo "No existing settings.json found. Creating a new one."
    mkdir -p "$(dirname "$SETTINGS_FILE")"
    echo "{
  // Global
  "files.autoSave": "onFocusChange",
  "security.workspace.trust.untrustedFiles": "open",
  "redhat.telemetry.enabled": false,
  // font
  "editor.fontSize": 13,
  "terminal.integrated.fontSize": 13,
  "workbench.tree.indent": 12,
  "chat.editor.fontSize": 13,
  "debug.console.fontSize": 13,
  "notebook.markup.fontSize": 13,
  // Workbench
  "workbench.colorTheme": "Default Dark+",
  "workbench.iconTheme": "material-icon-theme",
  "workbench.sideBar.location": "right",
  "workbench.tree.renderIndentGuides": "always",
  "workbench.startupEditor": "none",
  // Window
  "window.commandCenter": false,
  "window.customTitleBarVisibility": "auto",
  "window.restoreWindows": "none",
  // Editor
  "editor.accessibilitySupport": "off",
  "editor.minimap.enabled": false,
  "editor.minimap.showSlider": "always",
  "editor.wordWrap": "on",
  "editor.renderWhitespace": "trailing",
  "editor.formatOnSave": true,
  "editor.defaultFormatter": "charliermarsh.ruff",
  "workbench.editorAssociations": {
    "file:/**/*.csv": "jupyter-data-wrangler",
    "file:/**/*.parquet": "jupyter-data-wrangler",
    "file:/**/*.xls": "jupyter-data-wrangler",
    "file:/**/*.xlsx": "jupyter-data-wrangler",
    "*.geoparquet": "default",
    "*.html": "default"
  },
  // Explorer
  "explorer.confirmDelete": false,
  "explorer.confirmDragAndDrop": false,
  "editor.parameterHints.enabled": true,
  "python.analysis.enablePytestSupport": false,
  "python.analysis.inlayHints.functionReturnTypes": false,
  "python.analysis.inlayHints.variableTypes": false,
  "python.analysis.typeCheckingMode": "off",
  "python.analysis.include": [],
  "python.analysis.extraPaths": [],
  "python.analysis.autoFormatStrings": true,
  "python.venvPath": "C:\\Users\\nicolas.orieux1\\.venv",
  "python.defaultInterpreterPath": "C:\\Users\\nicolas.orieux1\\.venv\\ml_313\\Scripts\\python.exe",
  "python.analysis.packageIndexDepths": [
    {
      "name": "sklearn",
      "depth": 2,
      "includeAllSymbols": true
    },
    {
      "name": "matplotlib",
      "depth": 2,
      "includeAllSymbols": true
    },
    {
      "name": "polars",
      "depth": 2,
      "includeAllSymbols": true
    },
  ],
  "notebook.formatOnSave.enabled": true,
  "notebook.defaultFormatter": "charliermarsh.ruff",
  "notebook.formatOnCellExecution": true,
  "notebook.lineNumbers": "on",
  "notebook.output.wordWrap": true,
  "notebook.output.minimalErrorRendering": true,
  "notebook.codeActionsOnSave": {
    //"source.organizeImports.ruff": "explicit" // pas très pertinent
  },
  "notebook.output.scrolling": true,
  // Terminal
  "terminal.integrated.inheritEnv": false,
  "code-runner.runInTerminal": true,
  "python.terminal.activateEnvInCurrentTerminal": true,
  // rust
  "rust-analyzer.inlayHints.typeHints.enable": true,
  // C++
  "[cpp]": {
    "editor.defaultFormatter": "ms-vscode.cpptools"
  },
  // Git
  "git.autofetch": true,
  "git.confirmSync": false,
  "git.enableSmartCommit": true,
  "git.openRepositoryInParentFolders": "never",
  //Github Copilot
  "github.copilot.enable": {
    "*": true,
    "plaintext": false,
    "scminput": false,
    "jsonc": false,
    "yaml": false,
    "toml": false,
  },
  "github.copilot.nextEditSuggestions.enabled": false,
  // JSON
  "[json]": {
    "editor.defaultFormatter": "vscode.json-language-features"
  },
  "[jsonc]": {
    "editor.defaultFormatter": "vscode.json-language-features"
  },
  "notebook.output.textLineLimit": 50,
    }" > "$SETTINGS_FILE"  # Initialize with an empty JSON object
fi
