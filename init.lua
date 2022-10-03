--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {

  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "nightly", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_reload = false, -- automatically reload and sync packer after a successful update
    auto_quit = false, -- automatically quit the current session after a successful update
    -- remotes = { -- easily add new remotes to track
    --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
    --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
    --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    -- },
  },

  -- Set colorscheme to use
  colorscheme = "default_theme",

  -- Add highlight groups in any theme
  highlights = {
    -- duskfox = { -- a table of overrides/changes to the default
    --   Normal = { bg = "#000000" },
    -- },
  },

  -- set vim options here (vim.<first_key>.<second_key> =  value)
  options = {
    opt = {
      -- set to true or false etc.
      relativenumber = true, -- sets vim.opt.relativenumber
      number = true, -- sets vim.opt.number
      spell = true, -- sets vim.opt.spell
      signcolumn = "auto", -- sets vim.opt.signcolumn to auto
      wrap = false, -- sets vim.opt.wrap
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
      cmp_enabled = true, -- enable completion at start
      autopairs_enabled = true, -- enable autopairs at start
      diagnostics_enabled = true, -- enable diagnostics at start
      status_diagnostics_enabled = true, -- enable diagnostics in statusline

      copilot_no_tab_map = true,
      copilot_assume_mapped = true,
      copilot_tab_fallback = "",
      vimspector_enable_mappings = 'VISUAL_STUDIO',
    },
  },
  -- If you need more control, you can use the function()...end notation
  -- options = function(local_vim)
  --   local_vim.opt.relativenumber = true
  --   local_vim.g.mapleader = " "
  --   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
  --   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
  --
  --   return local_vim
  -- end,

  -- Set dashboard header
  header = {
    " █████  ███████ ████████ ██████   ██████",
    "██   ██ ██         ██    ██   ██ ██    ██",
    "███████ ███████    ██    ██████  ██    ██",
    "██   ██      ██    ██    ██   ██ ██    ██",
    "██   ██ ███████    ██    ██   ██  ██████",
    " ",
    "    ███    ██ ██    ██ ██ ███    ███",
    "    ████   ██ ██    ██ ██ ████  ████",
    "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
    "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
    "    ██   ████   ████   ██ ██      ██",
  },

  -- Default theme configuration
  default_theme = {
    -- Modify the color palette for the default theme
    colors = {
      fg = "#abb2bf",
      bg = "#1e222a",
    },
    highlights = function(hl) -- or a function that returns a new table of colors to set
      local C = require "default_theme.colors"

      hl.Normal = { fg = C.fg, bg = C.bg }

      -- New approach instead of diagnostic_style
      hl.DiagnosticError.italic = true
      hl.DiagnosticHint.italic = true
      hl.DiagnosticInfo.italic = true
      hl.DiagnosticWarn.italic = true

      return hl
    end,
    -- enable or disable highlighting for extra plugins
    plugins = {
      aerial = true,
      beacon = false,
      bufferline = true,
      dashboard = true,
      highlighturl = true,
      hop = false,
      indent_blankline = true,
      lightspeed = false,
      ["neo-tree"] = true,
      notify = true,
      ["nvim-tree"] = false,
      ["nvim-web-devicons"] = true,
      rainbow = true,
      symbols_outline = false,
      telescope = true,
      vimwiki = false,
      ["which-key"] = true,
    },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  -- Extend LSP configuration
  lsp = {
    on_attach = function(client, bufnr)
      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_del_augroup_by_name "auto_format"
      end
    end,
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    formatting = {
      disabled = { -- disable formatting capabilities for the listed clients
        -- "sumneko_lua",
      },
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- easily add or disable built in mappings added during LSP attaching
    mappings = {
      n = {
        -- ["<leader>lf"] = false -- disable formatting keymap
      },
    },
    -- add to the global LSP on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the mason server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")[server].setup(opts)
    -- end,

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for addings schemas to yamlls
      -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
    },
  },

  -- Mapping data with "desc" stored directly by vim.keymap.set().
  --
  -- Please use this mappings table to set keyboard mapping since this is the
  -- lower level configuration and more robust one. (which-key will
  -- automatically pick-up stored data by this setting.)
  mappings = {
    -- first key is the mode
    n = {
      -- second key is the lefthand side of the map
      -- mappings seen under group name "Buffer"
      ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
      ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
      ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
      ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },

      ["<leader>dd"] = { "<cmd>call vimspector#Launch()<cr>", desc = "Launch" },
      ["<leader>dS"] = { "<cmd>call vimspector#Stop()<cr>", desc = "Stop" },
      ["<leader>dc"] = { "<cmd>call vimspector#Continue()<cr>", desc = "Continue" },
      ["<leader>dp"] = { "<cmd>call vimspector#Pause()<cr>", desc = "Pause" },
      ["<leader>de"] = { "<cmd>call vimspector#Reset()<cr>", desc = "Reset" },
      ["<leader>dr"] = { "<cmd>call vimspector#Restart()<cr>", desc = "Restart" },
      ["<leader>dR"] = { "<cmd>call vimspector#RunToCursor()<cr>", desc = "Run to cursor" },
      ["<leader>dC"] = { "<cmd>call vimspector#GoToCurrentLine()", desc = "Go to current line" },
      ["<leader>dP"] = { "<cmd>call vimspector#JumpToProgramCounter()<cr>", desc = "Move Cursor to the program counter in current frame" },

      -- Breakpoints
      ["<leader>dbt"] = { "<cmd>call vimspector#ToggleBreakpoint()<cr>", desc = "Toggle breakpoint" },
      ["<leader>dbl"] = { "<cmd>call vimspector#ListBreakpoints()<cr>", desc = "List breakpoints" },
      ["<leader>dbc"] = { "<cmd>call vimspector#ClearBreakpoints()<cr>", desc = "Clear breakpoints" },
      ["<leader>dbC"] = { "<cmd>call vimspector#ToggleBreakpoint( { trigger expr, hit count expr } )<cr>", desc = "Toggle CBreakpoint or LogPoint on current line"},
      ["<leader>dbf"] = { "<cmd>call vimspector#AddFunctionBreakpoint( '<cexpr>' )<cr>", desc = "Add a function breakpoint for expression under cursor"},
      ["<leader>dbn"] = { "<cmd>call vimspector#JumpToNextBreakpoint()<cr>", desc = "Jump to next breakpoint" },
      ["<leader>dbp"] = { "<cmd>call vimspector#JumpToPreviousBreakpoint()<cr>", desc = "Jump to previous breakpoint" },

      -- Step
      ["<leader>dss"] = { "<cmd>call vimspector#StepOver()<cr>", desc = "Step over" },
      ["<leader>dsi"] = { "<cmd>call vimspector#StepOver()<cr>", desc = "Step into" },
      ["<leader>dso"] = { "<cmd>call vimspector#StepOut()<cr>", desc = "Step out" },

      -- Frames
      ["<leader>dfu"] = { "<cmd>call vimspector#UpFrame()<cr>", desc = "Up frame" },
      ["<leader>dfd"] = { "<cmd>call vimspector#DownFrame()<cr>", desc = "Down frame" },

      -- Mardown preview
      ["<leader>mp"] = { "<cmd>MarkdownPreview<cr>", desc = "Markdown preview" },
      ["<leader>ms"] = { "<cmd>MarkdownPreviewStop<cr>", desc = "Markdown preview stop" },
      ["<leader>mt"] = { "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown preview toggle" },

      -- Vimtex mappings
      ["<leader>xi"] = { "<cmd>VimtexInfo<cr>", desc = "Info" },
      ["<leader>xI"] = { "<cmd>VimtexInfoFull<cr>", desc = "Full info" },
      ["<leader>xt"] = { "<cmd>VimtexTocOpen<cr>", desc = "Open table of contents" },
      ["<leader>xT"] = { "<cmd>VimtexTocToggle<cr>", desc = "Toggle table of contents" },
      ["<leader>xq"] = { "<cmd>VimtexLog<cr>", desc = "Log" },
      ["<leader>xv"] = { "<cmd>VimtexView<cr>", desc = "View" },
      ["<leader>xr"] = { "<cmd>VimtexReverseSearch<cr>", desc = "Reverse search" },
      ["<leader>xl"] = { "<cmd>VimtexCompile<cr>", desc = "Compile (toggle)" },
      ["<leader>xL"] = { "<cmd>VimtexCompileSelected<cr>", desc = "Compile selected" },
      ["<leader>xk"] = { "<cmd>VimtexStop<cr>", desc = "Stop compilation" },
      ["<leader>xK"] = { "<cmd>VimtexStopAll<cr>", desc = "Stop all compilations" },
      ["<leader>xe"] = { "<cmd>VimtexErrors<cr>", desc = "Open quickfix window" },
      ["<leader>xo"] = { "<cmd>VimtexCompileOutput<cr>", desc = "Open compiler output" },
      ["<leader>xg"] = { "<cmd>VimtexStatus<cr>", desc = "Compilation status" },
      ["<leader>xG"] = { "<cmd>VimtexStatusAll<cr>", desc = "Show all compilations' status" },
      ["<leader>xc"] = { "<cmd>VimtexClean<cr>", desc = "Clean auxiliary files" },
      ["<leader>xC"] = { "<cmd>VimtexClean!<cr>", desc = "As Clean, but also remove output files" },
      ["<leader>xm"] = { "<cmd>VimtexImapsList<cr>", desc = "Show list of mappings created by vimtex-imaps" },
      ["<leader>xx"] = { "<cmd>VimtexReload<cr>", desc = "Reload vimtex" },
      ["<leader>xX"] = { "<cmd>VimtexReloadState<cr>", desc = "Reload the state for the current buffer" },
      ["<leader>xs"] = { "<cmd>VimtexToggleMain<cr>", desc = "Set current file as 'current project'" },
      ["<leader>xa"] = { "<cmd>VimtexContextMenu<cr>", desc = "Show context menu" },

      -- Autosave
      ["<C-s>"] = { "<cmd>ASToggle<cr>", desc = "Toggle autosave" },

      -- quick save
      -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    },
    t = {
      -- setting a mapping to false will disable it
      -- ["<esc>"] = false,
    },
    i = {
      ["<C-e>"] = { "copilot#Accept('<CR>')", silent = true, expr = true },
    }
  },

  -- Configure plugins
  plugins = {
    init = {
      -- You can disable default plugins as follows:
      -- ["goolord/alpha-nvim"] = { disable = true },

      -- You can also add new plugins here as well:
      -- Add plugins, the packer syntax without the "use"
      -- { "andweeb/presence.nvim" },
      -- {
      --   "ray-x/lsp_signature.nvim",
      --   event = "BufRead",
      --   config = function()
      --     require("lsp_signature").setup()
      --   end,
      -- },
      --
      {"github/copilot.vim"},
      {"puremourning/vimspector"},
      {"lervag/vimtex"},
      {"jiriks74/vim-pio"},
      {
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
      },
      {
        "Pocco81/auto-save.nvim",
        config = function()
          require("auto-save").setup()
        end,
      },


      -- We also support a key value style plugin definition similar to NvChad:
      -- ["ray-x/lsp_signature.nvim"] = {
      --   event = "BufRead",
      --   config = function()
      --     require("lsp_signature").setup()
      --   end,
      -- },
    },
    -- All other entries override the require("<key>").setup({...}) call for default plugins
    ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
      -- config variable is the default configuration table for the setup function call
      -- local null_ls = require "null-ls"

      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      config.sources = {
        -- Set a formatter
        -- null_ls.builtins.formatting.stylua,
        -- null_ls.builtins.formatting.prettier,
      }
      return config -- return final config table
    end,
    treesitter = { -- overrides `require("treesitter").setup(...)`
      -- ensure_installed = { "lua" },
    },
    -- use mason-lspconfig to configure LSP installations
    ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
      -- ensure_installed = { "sumneko_lua" },
    },
    -- use mason-tool-installer to configure DAP/Formatters/Linter installation
    ["mason-tool-installer"] = { -- overrides `require("mason-tool-installer").setup(...)`
      -- ensure_installed = { "prettier", "stylua" },
    },
  },

  -- LuaSnip Options
  luasnip = {
    -- Add paths for including more VS Code style snippets in luasnip
    vscode_snippet_paths = {},
    -- Extend filetypes
    filetype_extend = {
      -- javascript = { "javascriptreact" },
    },
  },

  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },

  -- Modify which-key registration (Use this with mappings table in the above.)
  ["which-key"] = {
    -- Add bindings which show up as group name
    register = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- third key is the key to bring up next level and its displayed
          -- group name in which-key top level menu
          ["b"] = { name = "Buffer" },
          ["d"] = { 
            name = "Debugging",
            ["b"] = { name = "Breakpoints" },
            ["s"] = { name = "Step" },
            ["f"] = { name = "Frames" },
          },
          ["m"] = { name = "Markdown" },
          ["x"] = { name = "LaTeX" },
        },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}

return config
