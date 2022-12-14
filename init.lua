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
    -- init = { -- this table overrides highlights in all themes
    --   Normal = { bg = "#000000" },
    -- }
    -- duskfox = { -- a table of overrides/changes to the duskfox theme
    --   Normal = { bg = "#000000" },
    -- },
  },

  -- set vim options here (vim.<first_key>.<second_key> =  value)
  options = {
    opt = {
      -- set to true or false etc.
      relativenumber = true, -- sets vim.opt.relativenumber
      number = true, -- sets vim.opt.number
      spell = false, -- sets vim.opt.spell
      signcolumn = "auto", -- sets vim.opt.signcolumn to auto
      wrap = false, -- sets vim.opt.wrap

      -- Treesitter
      foldenable = false,
      foldexpr = "nvim_treesitter#foldexpr()", -- set Treesitter based folding
      foldmethod = "expr",
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

      -- Taglist
      Tlist_Use_Right_Window = 1,
      Tlist_GainFocus_On_ToggleOpen = 1,
      Tlist_Auto_Update = 1,
      -- Tlist_Close_On_Select = 1,
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
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    formatting = {
      format_on_save = false, -- enable or disable auto formatting on save
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
      clangd = {
        capabilities = { offsetEncoding = "utf-8" },
      }
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
      ["<leader>uD"] = { "<cmd>Alpha<cr>", desc = "Alpha dashboard" },

      -- Debugger mappings
      -- Config loading
      ["<leader>dlc"] = { function() require("dap.ext.vscode").load_launchjs(nil, { cppdbg = { "c", "cpp" } }) end, desc = "C/C++" },

      -- Function keys mappings
      ["<F5>"] = { function() require("dap").continue() end, desc = "Debugger: Start" },
      ["<F17>"] = { function() require("dap").terminate() end, desc = "Debugger: Stop" }, -- Shift+F5
      ["<F29>"] = { function() require("dap").restart_frame() end, desc = "Debugger: Restart" }, -- Control+F5
      ["<F6>"] = { function() require("dap").pause() end, desc = "Debugger: Pause" },
      ["<F9>"] = { function() require("dap").toggle_breakpoint() end, desc = "Debugger: Toggle Breakpoint" },
      ["<F10>"] = { function() require("dap").step_over() end, desc = "Debugger: Step Over" },
      ["<F11>"] = { function() require("dap").step_into() end, desc = "Debugger: Step Into" },
      ["<F23>"] = { function() require("dap").step_out() end, desc = "Debugger: Step Out" }, -- Shift+F11
      
      -- Breakpoints
      ["<leader>db"] = { function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint (F9)" },
      ["<leader>dB"] = { function() require("dap").clear_breakpoints() end, desc = "Clear Breakpoints" },
      
      -- Session actions
      ["<leader>dc"] = { function() require("dap").continue() end, desc = "Start/Continue (F5)" },
      ["<leader>dp"] = { function() require("dap").pause() end, desc = "Pause (F6)" },
      ["<leader>dr"] = { function() require("dap").restart_frame() end, desc = "Restart (C-F5)" },
      ["<leader>dq"] = { function() require("dap").close() end, desc = "Close Session" },
      ["<leader>dQ"] = { function() require("dap").terminate() end, desc = "Terminate Session (S-F5)" },
      
      -- Step
      ["<leader>di"] = { function() require("dap").step_into() end, desc = "Step Into (F11)" },
      ["<leader>do"] = { function() require("dap").step_over() end, desc = "Step Over (F10)" },
      ["<leader>dO"] = { function() require("dap").step_out() end, desc = "Step Out (S-F11)" },

      -- Repls (debugger)
      ["<leader>dR"] = { function() require("dap").repl.toggle() end, desc = "Toggle REPL" },

      -- Dap-UI
      ["<leader>du"] = { function() require("dapui").toggle() end, desc = "Toggle Debugger UI" },
      ["<leader>dh"] = { function() require("dap.ui.widgets").hover() end, desc = "Debugger Hover" },

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

      -- Taglist
      ["<leader>ft"] = { "<cmd>TlistToggle<cr>", desc = "Tagbar toggle " },

      -- Trouble
      ["<leader>ttx"] = { "<cmd>TroubleToggle<cr>", desc = "Toggle Trouble" },
      ["<leader>ttw"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace diagnostics" },
      ["<leader>ttd"] = { "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document diagnostics" },
      ["<leader>ttq"] = { "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix" },
      ["<leader>ttl"] = { "<cmd>TroubleToggle loclist<cr>", desc = "Loc List" },
      ["<leader>ttR"] = { "<cmd>TroubleToggle lsp_references<cr>", desc = "Lsp references" },
      ["<leader>ttt"] = { "<cmd>TodoTrouble<cr>", desc = "Todo Trouble" },

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
      -- ["<Tab>"] = { "copilot#Accept('<CR>')", silent = true, expr = true },
    }
  },

  -- Configure plugins
  plugins = {
    init = {
      -- You can disable default plugins as follows:
      -- ["goolord/alpha-nvim"] = { disable = true },

      -- You can also add new plugins here as well:
      -- Add plugins, the packer syntax without the "use"
      { "andweeb/presence.nvim" },
      -- {
      --   "ray-x/lsp_signature.nvim",
      --   event = "BufRead",
      --   config = function()
      --     require("lsp_signature").setup()
      --   end,
      -- },

      {
        "folke/todo-comments.nvim",
        event = "BufRead",
        config = function()
          require("todo-comments").setup()
        end,
      },
      { "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
          require("trouble").setup {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
          }
        end
      },
      { "yegappan/taglist" },
      { "github/copilot.vim" },
      -- LaTeX
      { "lervag/vimtex" },
      -- PlatformIO
      { "normen/vim-pio" },
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
      { "weirongxu/plantuml-previewer.vim" },
      { "aklt/plantuml-syntax" },
      { "tyru/open-browser.vim" },
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
    -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
    ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
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
            ["l"] = { name = "Load launch.json" },
          },
          ["m"] = { name = "Markdown" },
          ["x"] = { name = "LaTeX" },
          ["t"] = {
            name = "Terminal",
            ["t"] = { name = "Trouble" },
          },
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
    local function alpha_on_bye(cmd)
      local bufs = vim.fn.getbufinfo { buflisted = true }
      vim.cmd(cmd)
      if require("core.utils").is_available "alpha-nvim" and not bufs[2] then
        require("alpha").start(true)
      end
    end

    vim.keymap.del("n", "<leader>c")
    if require("core.utils").is_available "bufdelete.nvim" then
      vim.keymap.set("n", "<leader>c", function()
        alpha_on_bye "Bdelete!"
      end, { desc = "Close buffer" })
    else
      vim.keymap.set("n", "<leader>c", function()
        alpha_on_bye "bdelete!"
      end, { desc = "Close buffer" })
    end
  end,
}

return config
