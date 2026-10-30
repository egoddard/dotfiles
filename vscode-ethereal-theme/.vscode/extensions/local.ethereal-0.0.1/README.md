# Ethereal for VS Code

Port of `lazyvim-clean/.config/nvim/colors/ethereal.lua`, with slightly lighter backgrounds (`#0d1430` editor, `#0a1026` sidebars and panels).

## Install

Stow the package from the dotfiles root (edits apply on window reload):

```sh
mkdir -p ~/.vscode/extensions
stow vscode-ethereal-theme
```

Create `~/.vscode/extensions` first so stow links only the extension folder rather than the whole `~/.vscode` tree.

If VS Code doesn't pick up the symlinked folder, package and install it instead:

```sh
cd ~/dotfiles/vscode-ethereal-theme/.vscode/extensions/local.ethereal-0.0.1
npx @vscode/vsce package --allow-missing-repository
code --install-extension ethereal-0.0.1.vsix
```

Then select **Ethereal** via `Preferences: Color Theme`, or set `"workbench.colorTheme": "Ethereal"` in `~/.config/Code/User/settings.json`.

To match the prompt colors in Ghostty, also set `"terminal.integrated.drawBoldTextInBrightColors": false` so bold text keeps its normal ANSI color.
