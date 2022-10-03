# My [AstroNvim](https://github.com/AstroNvim/AstroNvim) config

## How to install my config

- First you have to install AstroNvim
  - Backup your previous nvim config

  ```bash
  mv ~/.config/nvim ~/.config/nvimbackup
  ```

  - Clone AstroNvim repository into ~/.config/nvim

  ```bash
  git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
  nvim +PackerSync
  ```

- Clone my config into `~/.config/nvim/lua/user`
  - For NeoVim >= 8.0

  ```bash
  git clone https://github.com/jiriks74/astronvim_config ~/.config/nvim/lua/user
  ```

  - For NeoVim < 8.0 use `neovim7.2` branch

  ```bash
  git clone -b neovim7.2 https://github.com/jiriks74/astronvim_config ~/.config/nvim/lua/user
  ```

- Open nvim and run `:PackerSync`

```bash
nvim +PackerSync
```

## Extra plugins included

- [vimspector](https://github.com/puremourning/vimspector)
  - Simple plugin for debugging
  - You need have to have `neovim` python module installed

  ```bash
  pip3 install neovim
  ```

  - You have to create a file with `Launch` config - see the [plugin repository](https://github.com/puremourning/vimspector)
- [vim-pio](https://github.com/jiriks74/vim-pio)
  - PlatformIO vim plugin
  - This is a fork that I modified to work with clangd as this is what is the
  easiest to setup in AstroNvim
- [vimtex](https://github.com/lervag/vimtex)
  - A plugin for, you guessed it, LaTex
  - I have not yet learned LaTex, so I haven't tried this plugin out.
  - This plugin needs you to have LaTeX installed on your system. To see more go to the [vimtex repository](https://github.com/lervag/vimtex)
  Hopefully I'll learn it and try out this plugin soon
- [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)
  - Plugin for live markdown preview in a web browser
- [copilot.vim](https://github.com/github/copilot.vim)
  - Github's copilot plugin for Vim
  - To use the plugin you have to login with this command
    - `:Copilot setup`
- [Pocco81/auto-save.nvim](https://github.com/Pocco81/auto-save.nvim)
  - Plugin for autosave

## Extra mappings

| Shortcut |   Vim keybind   |    Description    |
|----------|-----------------|-------------------|
| Space+a  | ["\<leader\>a"] | Alpha Dashboard   |
| CTRL+e   | ["\<C-e\>"]     | Copilot accept    |
| CTRL+s   | ["\<C-s\>"]     | Toggle autosave   |

- Mappings for vimspector (debugging)

|   Shortcut  |    Vim keybind    |     Description    |
|-------------|-------------------|--------------------|
|  Space+d+d  | ["\<leader\>dd"]  | Launch             |
|  Space+d+S  | ["\<leader\>dS"]  | Stop               |
|  Space+d+c  | ["\<leader\>dc"]  | Continue           |
|  Space+d+p  | ["\<leader\>dp"]  | Pause              |
|  Space+d+e  | ["\<leader\>de"]  | Reset              |
|  Space+d+r  | ["\<leader\>dr"]  | Restart            |
|  Space+d+R  | ["\<leader\>dR"]  | Run to cursor      |
|  Space+d+C  | ["\<leader\>dC"]  | Go to current line |
|  Space+d+P  | ["\<leader\>dP"]  | Move cursor to the program counter in current frame |
|             | Breakpoints       |                    |
| Space+d+b+t | ["\<leader\>dbt"] | Toggle breakpoint  |
| Space+d+b+l | ["\<leader\>dbl"] | List breakpoints   |
| Space+d+b+c | ["\<leader\>dbc"] | Clear breakpoints  |
| Space+d+b+C | ["\<leader\>dbC"] | Toggle CBreakpoint or LogPoint on current line |
| Space+d+b+f | ["\<leader\>dbf"] | Add a function breakpoint for expression under cursor |
| Space+d+b+n | ["\<leader\>dbn"] | Jump to next breakpoint |
| Space+d+b+p | ["\<leader\>dbp"] | Jump to previous breakpoint |
|             | Step keybinds     |                    |
| Space+d+s+s | ["\<leader\>dss"] | Step over          |
| Space+d+s+i | ["\<leader\>dsi"] | Step into          |
| Space+d+s+o | ["\<leader\>dso"] | Step out           |
|             | Frame keybinds    |                    |
| Space+d+f+u | ["\<leader\>dfu"] | Up frame           |
| Space+d+f+d | ["\<leader\>dfd"] | Down frame         |

There are also some [VSCode like keybinds setup by the plugin](https://github.com/puremourning/vimspector#visual-studio--vscode)

- Mappings for markdown preview

| Shortcut  |   Vim keybind    |       Description       |
|-----------|------------------|-------------------------|
| Space+m+p | ["\<leader\>mp"] | Markdown preview        |
| Space+m+s | ["\<leader\>ms"] | Markdown preview stop   |
| Space+m+t | ["\<leader\>mt"] | Markdown preview toggle |
