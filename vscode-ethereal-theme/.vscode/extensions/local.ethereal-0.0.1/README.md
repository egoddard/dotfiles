# Ethereal for VS Code

Port of `lazyvim-clean/.config/nvim/colors/ethereal.lua`.

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

Then select **Ethereal** via `Preferences: Color Theme` (already set in `vscode/.config/Code/User/settings.json`).
