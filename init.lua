--              AstroNvim Configuration Table
-- All configuration changes should go inside of the table below

-- A split up user configuration example can be found at: https://github.com/AstroNvim/split_user_example

-- You can think of a Lua "table" as a dictionary like data structure the
-- normal format is "key = value". These also handle array like data structures
-- where a value with no key simply has an implicit numeric key
local config = {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin",     -- remote to use
    channel = "nightly",   -- "stable" or "nightly"
    version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly",    -- branch name (NIGHTLY ONLY)
    commit = nil,          -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false,  -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false,     -- automatically quit the current session after a successful update
    -- remotes = { -- easily add new remotes to track
    --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
    --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
    --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    -- },
  },
  -- Set colorscheme to use
  -- colorscheme = "astrodark",
  colorscheme = "tokyonight-night",
  -- Add highlight groups in any theme
  highlights = {
    -- init = { -- this table overrides highlights in all themes
    --   Normal = { bg = "#000000" },
    -- }
    -- duskfox = { -- a table of overrides/changes to the duskfox theme
    --   Normal = { bg = "#000000" },
    -- },
  },
  -- set vim options here (vim.<first_key>.<second_key> = value)
  options = {
    opt = {
      -- set to true or false etc.
      relativenumber = true, -- sets vim.opt.relativenumber
      number = true,         -- sets vim.opt.number
      spell = false,         -- sets vim.opt.spell
      signcolumn = "auto",   -- sets vim.opt.signcolumn to auto
      wrap = false,          -- sets vim.opt.wrap
    },
    g = {
      mapleader = " ",                 -- sets vim.g.mapleader
      autoformat_enabled = true,       -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
      cmp_enabled = true,              -- enable completion at start
      autopairs_enabled = true,        -- enable autopairs at start
      diagnostics_mode = 3,            -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
      icons_enabled = true,            -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
      ui_notifications_enabled = true, -- disable notifications when toggling UI elements
      -- Copilot
      copilot_no_tab_map = true,
      copilot_assume_mapped = true,
      copilot_tab_fallback = "",
      -- Taglist
      Tlist_Use_Right_Window = 1,
      Tlist_GainFocus_On_ToggleOpen = 1,
      Tlist_Auto_Update = 1,
      -- Tlist_Close_On_Select = 1,

      -- MarkdownPreview
      mkdp_auto_close = 0
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

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    underline = true,
  },
  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = false,    -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
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

    -- override the LSP setup handler function based on server name
    -- setup_handlers = {
    --   -- first function changes the default setup handler
    --   function(server, opts) require("lspconfig")[server].setup(opts) end,
    --   -- keys for a specific server name will be used for that LSP
    --   lua_ls = function(server, opts)
    --     -- custom lua_ls setup handler
    --     require("lspconfig")["lua_ls"].setup(opts)
    --   end,
    -- },

    -- Add overrides for LSP server settings, the keys are the name of the server
    config = {
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
      },
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
      -- tables with the `name` key will be registered with which-key if it's installed
      -- this is useful for naming menus
      ["<leader>b"] = { name = "Buffers" },
      -- Trigger Alpha dashboard on close when no buffers are left
      ["<leader>c"] = {
        function()
          local bufs = vim.fn.getbufinfo { buflisted = true }
          require("astronvim.utils.buffer").close(0)
          if require("astronvim.utils").is_available "alpha-nvim" and not bufs[2] then require("alpha").start(true) end
        end,
        desc = "Close buffer",
      },
      -- quick save
      -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

      -- Debugger mappings
      ["<leader>d"] = { name = "Debugger" },
      ["<leader>dl"] = { name = "Load launch.json" },
      -- Config loading
      ["<leader>dlc"] = { function() require("dap.ext.vscode").load_launchjs(nil, { cppdbg = { "c", "cpp", "asm" } }) end, desc =
      "C/C++/asm" },
      -- Function keys mappings
      ["<F5>"] = { function() require("dap").continue() end, desc = "Debugger: Start" },
      ["<F17>"] = { function() require("dap").terminate() end, desc = "Debugger: Stop" },        -- Shift+F5
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
      ["<leader>x"] = { name = "LaTeX" },
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
      ["<leader>fT"] = { "<cmd>TlistToggle<cr>", desc = "Tagbar toggle " },
      -- Trouble
      -- ["<leader>ft"] = { name = "Trouble" },
      ["<leader>ftx"] = { "<cmd>TroubleToggle<cr>", desc = "Toggle Trouble" },
      ["<leader>ftw"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace diagnostics" },
      ["<leader>ftd"] = { "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document diagnostics" },
      ["<leader>ftq"] = { "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix" },
      ["<leader>ftl"] = { "<cmd>TroubleToggle loclist<cr>", desc = "Loc List" },
      ["<leader>ftR"] = { "<cmd>TroubleToggle lsp_references<cr>", desc = "Lsp references" },
      -- ["<leader>ftt"] = { "<cmd>TodoTrouble<cr>", desc = "Todo Trouble" },
      -- Autosave
      ["<C-s>"] = { "<cmd>ASToggle<cr>", desc = "Toggle autosave" },
      ["<leader>fs"] = { "<cmd>ASToggle<cr>", desc = "Toggle autosave" },
      -- Carbon code sharing
      ["<leader>S"] = { "CarbonNow", desc = "Share code on Carbon", silent = true },
    },
    v = {
      -- Carbon code sharing
      ["<leader>s"] = { ":CarbonNow<CR>", desc = "Share code on Carbon", silent = true },
    },
    t = {
      -- setting a mapping to false will disable it
      -- ["<esc>"] = false,
    },
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = {
          "tohtml",
          "gzip",
          "matchit",
          "zipPlugin",
          "netrwPlugin",
          "tarPlugin",
          "matchparen",
        },
      },
    },
  },
  -- Configure plugins
  plugins = {
    -- Theme
    {
      "folke/tokyonight.nvim",
      event = "UIEnter"
    },
    -- You can disable default plugins as follows:
    -- { "max397574/better-escape.nvim", enabled = false },
    --
    -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
    -- {
    --   "L3MON4D3/LuaSnip",
    --   config = function(plugin, opts)
    --     require "plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
    --     -- add more custom luasnip configuration such as filetype extend or custom snippets
    --     local luasnip = require "luasnip"
    --     luasnip.filetype_extend("javascript", { "javascriptreact" })
    --   end,
    -- },
    -- {
    --   "windwp/nvim-autopairs",
    --   config = function(plugin, opts)
    --     require "plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
    --     -- add more custom autopairs configuration such as custom rules
    --     local npairs = require "nvim-autopairs"
    --     local Rule = require "nvim-autopairs.rule"
    --     local cond = require "nvim-autopairs.conds"
    --     npairs.add_rules(
    --       {
    --         Rule("$", "$", { "tex", "latex" })
    --           -- don't add a pair if the next character is %
    --           :with_pair(cond.not_after_regex "%%")
    --           -- don't add a pair if  the previous character is xxx
    --           :with_pair(
    --             cond.not_before_regex("xxx", 3)
    --           )
    --           -- don't move right when repeat character
    --           :with_move(cond.none())
    --           -- don't delete if the next character is xx
    --           :with_del(cond.not_after_regex "xx")
    --           -- disable adding a newline when you press <cr>
    --           :with_cr(cond.none()),
    --       },
    --       -- disable for .vim files, but it work for another filetypes
    --       Rule("a", "a", "-vim")
    --     )
    --   end,
    -- },
    -- By adding to the which-key config and using our helper function you can add more which-key registered bindings
    {
      "folke/which-key.nvim",
      config = function(plugin, opts)
        require "plugins.configs.which-key" (plugin, opts)
        -- Add bindings which show up as group name
        local wk = require "which-key"
        wk.register({
          m = { name = "Markdown" },
          ft = { name = "Trouble" },
          b = { name = "Buffers" },
        }, { mode = "n", prefix = "<leader>" })
      end,
    },
    --

    {
      -- override nvim-cmp plugin
      "hrsh7th/nvim-cmp",
      -- override the options table that is used in the `require("cmp").setup()` call
      opts = function(_, opts)
        -- opts parameter is the default options table
        -- the function is lazy loaded so cmp is able to be required
        local cmp = require "cmp"
        local luasnip = require "luasnip"
        -- modify the mapping part of the table
        opts.mapping["<CR>"] = cmp.mapping.confirm { select = false }
        opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
          vim.api.nvim_feedkeys(vim.fn['copilot#Accept'](vim.api.nvim_replace_termcodes('<Tab>', true, true, true)), 'n',
            true)
        end)
        if luasnip.expandable() then
          luasnip.expand()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
          fallback()
        end
        opts.experimental = {
          ghost_text = false -- this feature conflict with copilot.vim's preview.
        }
        -- return the new table to be used
        return opts
      end,
    },

    -- Editorconfig
    {
      "editorconfig/editorconfig-vim",
      event = "BufRead"
    },

    -- You can also add new plugins here as well:
    -- Add plugins, the lazy syntax

    -- Plugins for other plugins
    {
      "tyru/open-browser.vim",
      cmd = { "OPenBrowser", "OpenBrowserSearch", "OpenBrowserSmartSearch" }
    },

    --Social
    {
      "andweeb/presence.nvim",
      event = "UIEnter"
    },
    {
      "ellisonleao/carbon-now.nvim",
      cmd = "CarbonNow",
      opts = {
        base_url = "https://carbon.now.sh/",
        open_cmd = "xdg-open",
        options = {
          theme = "night-owl",
          window_theme = "none",
          font_family = "Hack",
          font_size = "18px",
          bg = "gray",
          line_numbers = true,
          line_height = "133%",
          drop_shadow = false,
          drop_shadow_offset_y = "20px",
          drop_shadow_blur = "68px",
          width = "680",
          watermark = false,
        },
      }
    },

    -- Comments
    {
      "folke/todo-comments.nvim",
      event = "BufEnter",
    },
    -- Show todo comments, warnings, errors, ...
    {
      "folke/trouble.nvim",
      -- cmd = { "TroubleToggle", "TodoTrouble" }
      cmd = "TroubleToggle"
    },
    -- TOC (functions, macros, ...)
    {
      "yegappan/taglist",
      cmd = "TlistToggle"
    },

    -- Code completion
    {
      "github/copilot.vim",
      event = "UIEnter"
    },

    -- PlatformIO
    {
      "normen/vim-pio",
      -- event = "BufEnter"
      cmd = { "PIO", "PIOInit", "PIOInstall", "PIOUninstall", "PIONewProject", "PIOAddLibrary", "PIORemoveLibrary" }
    },

    -- Text related
    {
      -- LaTeX
      "lervag/vimtex",
      event = "BufEnter *.tex"
    },
    {
      "iamcco/markdown-preview.nvim",
      event = "BufEnter *.md",
      config = function() vim.fn["mkdp#util#install"]() end,
    },

    -- PlantUML
    {
      "weirongxu/plantuml-previewer.vim",
      event = "BufEnter *.uml",
    },
    {
      "aklt/plantuml-syntax",
      event = "BufEnter *.uml"
    },

    -- Basic editor functionality
    {
      "Pocco81/auto-save.nvim",
      event = "UIEnter",
      config = function()
        require("auto-save").setup()
      end,
    },

    -- {
    --   "ray-x/lsp_signature.nvim",
    --   event = "BufRead",
    --   config = function()
    --     require("lsp_signature").setup()
    --   end,
    -- },

    -- Plugin entries can also be used to override the default options for plugins as well
    {
      "goolord/alpha-nvim",
      opts = function(_, opts)
        -- customize the dashboard header
        opts.section.header.val = {
          "███████ ████████ ███████ ███████ ██   ██  █████     ███████ ██    ██ ",
          "██         ██    ██      ██      ██  ██  ██   ██    ██      ██    ██ ",
          "███████    ██    █████   █████   █████   ███████    █████   ██    ██ ",
          "     ██    ██    ██      ██      ██  ██  ██   ██    ██      ██    ██ ",
          "███████    ██    ███████ ██      ██   ██ ██   ██ ██ ███████  ██████  ",
          "",
          "              █████  ███████ ████████ ██████   ██████  ",
          "             ██   ██ ██         ██    ██   ██ ██    ██ ",
          "             ███████ ███████    ██    ██████  ██    ██ ",
          "             ██   ██      ██    ██    ██   ██ ██    ██ ",
          "             ██   ██ ███████    ██    ██   ██  ██████  ",
          "",
          "                 ███    ██ ██    ██ ██ ███    ███",
          "                 ████   ██ ██    ██ ██ ████  ████",
          "                 ██ ██  ██ ██    ██ ██ ██ ████ ██",
          "                 ██  ██ ██  ██  ██  ██ ██  ██  ██",
          "                 ██   ████   ████   ██ ██      ██",
        }
        return opts
      end,
    },
    {
      "jose-elias-alvarez/null-ls.nvim",
      opts = function(_, config)
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
    },
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        -- ensure_installed = { "lua" },
      },
    },
    -- use mason-lspconfig to configure LSP installations
    {
      "williamboman/mason-lspconfig.nvim",
      -- overrides `require("mason-lspconfig").setup(...)`
      opts = {
        -- ensure_installed = { "lua_ls" },
      },
    },
    -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
    {
      "jay-babu/mason-null-ls.nvim",
      -- overrides `require("mason-null-ls").setup(...)`
      opts = {
        -- ensure_installed = { "prettier", "stylua" },
      },
    },
    {
      "jay-babu/mason-nvim-dap.nvim",
      -- overrides `require("mason-nvim-dap").setup(...)`
      opts = {
        -- ensure_installed = { "python" },
      },
    },
  },
  -- Customize Heirline options
  heirline = {
    -- -- Customize different separators between sections
    -- separators = {
    --   breadcrumbs = " > ",
    --   tab = { "", "" },
    -- },
    -- -- Customize colors for each element each element has a `_fg` and a `_bg`
    -- colors = function(colors)
    --   colors.git_branch_fg = require("astronvim.utils").get_hlgroup "Conditional"
    --   return colors
    -- end,
    -- -- Customize attributes of highlighting in Heirline components
    -- attributes = {
    --   -- styling choices for each heirline element, check possible attributes with `:h attr-list`
    --   git_branch = { bold = true }, -- bold the git branch statusline component
    -- },
    -- -- Customize if icons should be highlighted
    -- icon_highlights = {
    --   breadcrumbs = false, -- LSP symbols in the breadcrumbs
    --   file_icon = {
    --     winbar = false, -- Filetype icon in the winbar inactive windows
    --     statusline = true, -- Filetype icon in the statusline
    --     tabline = true, -- Filetype icon in the tabline
    --   },
    -- },
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
