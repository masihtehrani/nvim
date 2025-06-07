-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
-- if true then return {} end

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  { import = "lazyvim.plugins" },

  -- 2. LazyVim extras
  -- { import = "lazyvim.plugins.extras.coding.blink" },
  { import = "lazyvim.plugins.extras.coding.mini-comment" },
  { import = "lazyvim.plugins.extras.coding.mini-snippets" },
  { import = "lazyvim.plugins.extras.coding.mini-surround" },
  { import = "lazyvim.plugins.extras.coding.neogen" },
  { import = "lazyvim.plugins.extras.coding.yanky" },
  { import = "lazyvim.plugins.extras.dap.core" },
  { import = "lazyvim.plugins.extras.editor.aerial" },
  { import = "lazyvim.plugins.extras.editor.dial" },
  { import = "lazyvim.plugins.extras.editor.fzf" },
  { import = "lazyvim.plugins.extras.editor.inc-rename" },
  { import = "lazyvim.plugins.extras.editor.mini-diff" },
  { import = "lazyvim.plugins.extras.editor.mini-files" },
  { import = "lazyvim.plugins.extras.editor.mini-move" },
  { import = "lazyvim.plugins.extras.editor.neo-tree" },
  { import = "lazyvim.plugins.extras.editor.overseer" },
  { import = "lazyvim.plugins.extras.editor.refactoring" },
  { import = "lazyvim.plugins.extras.formatting.prettier" },
  { import = "lazyvim.plugins.extras.test.core" },
  { import = "lazyvim.plugins.extras.ui.indent-blankline" },
  { import = "lazyvim.plugins.extras.ui.mini-starter" },
  { import = "lazyvim.plugins.extras.util.dot" },
  { import = "lazyvim.plugins.extras.util.startuptime" },
  { import = "lazyvim.plugins.extras.vscode" },
  { import = "lazyvim.plugins.extras.lang.typescript" },
  { import = "lazyvim.plugins.extras.lang.go" },
  { import = "lazyvim.plugins.extras.lang.docker" },
  { import = "lazyvim.plugins.extras.lang.git" },
  { import = "lazyvim.plugins.extras.lang.sql" },
  { import = "lazyvim.plugins.extras.lang.tailwind" },
  { import = "lazyvim.plugins.extras.lang.toml" },
  { import = "lazyvim.plugins.extras.lang.vue" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lang.python" },
  { import = "lazyvim.plugins.extras.lang.rust" },

  -- Custom plugins and configurations
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false,
    opts = {
      provider = "gemini",
      gemini = {
        model = "gemini-2.5-flash-preview-04-17",
        -- model = "gemini-2.5-pro-preview-05-06",
        timeout = 30000,
        temperature = 0.7, -- برای پاسخ‌های دقیق‌تر
        max_tokens = 8192,
      },
      behaviour = {
        auto_suggestions = false,
        auto_apply = false,
      },
      mappings = {
        ask = "<leader>aa", -- کلید جدا برای پرس‌وجو
        edit = "<leader>ae", -- کلید جدا برای ویرایش
        refresh = "<leader>ar",
      },
    },
    build = ":AvanteBuild", -- به‌جای make
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
      "nvim-treesitter/nvim-treesitter",
    },
  },

  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-storm",
    },
  },

  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },

  -- disable trouble
  { "folke/trouble.nvim", enabled = false },

  -- override nvim-cmp and add cmp-emoji (remove codecompanion as a source)
  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = { "hrsh7th/cmp-emoji" },
  --   ---@param opts cmp.ConfigSchema
  --   opts = function(_, opts)
  --     table.insert(opts.sources, { name = "emoji" })
  --     table.insert(opts.sources, { name = "minuet", group_index = 1, priority = 100 })
  --     -- Removed: table.insert(opts.sources, { name = "codecompanion", group_index = 1, priority = 100 })
  --     opts.performance = {
  --       fetching_timeout = 2000, -- برای LLMهای کندتر
  --     }
  --     opts.mapping = vim.tbl_deep_extend("force", opts.mapping or {}, {
  --       ["<A-y>"] = require("avante").make_cmp_map(),
  --     })
  --   end,
  -- },
  {
  "hrsh7th/nvim-cmp",
  version = false, -- last release is way too old
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "Yu-Leo/cmp-go-pkgs",
      {
      "garymjr/nvim-snippets",
      opts = {
        friendly_snippets = true,
      },
      dependencies = { "rafamadriz/friendly-snippets" },
    },
  },
  -- Not all LSP servers add brackets when completing a function.
  -- To better deal with this, LazyVim adds a custom option to cmp,
  -- that you can configure. For example:
  --
  -- ```lua
  -- opts = {
  --   auto_brackets = { "python" }
  -- }
  -- ```
  opts = function(_, opts)
    opts.snippet = {
      expand = function(item)
        return LazyVim.cmp.expand(item.body)
      end,
    }
    if LazyVim.has("nvim-snippets") then
      table.insert(opts.sources, { name = "snippets" })
    end

    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
    local cmp = require("cmp")
    local defaults = require("cmp.config.default")()
    local auto_select = true
    return {
      auto_brackets = {}, -- configure any filetype to auto add brackets
      completion = {
        completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
      },
      preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = LazyVim.cmp.confirm({ select = auto_select }),
        ["<C-y>"] = LazyVim.cmp.confirm({ select = true }),
        ["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<C-CR>"] = function(fallback)
          cmp.abort()
          fallback()
        end,
        ["<tab>"] = function(fallback)
          return LazyVim.cmp.map({ "snippet_forward", "ai_accept" }, fallback)()
        end,
      }),
      sources = cmp.config.sources({
        { name = "lazydev" },
        { name = "nvim_lsp" },
        { name = "path" },
      }, {
        { name = "buffer" },
      }),
      formatting = {
        format = function(entry, item)
          local icons = LazyVim.config.icons.kinds
          if icons[item.kind] then
            item.kind = icons[item.kind] .. item.kind
          end

          local widths = {
            abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
            menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
          }

          for key, width in pairs(widths) do
            if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
              item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
            end
          end

          return item
        end,
      },
      experimental = {
        -- only show ghost text when we show ai completions
        ghost_text = vim.g.ai_cmp and {
          hl_group = "CmpGhostText",
        } or false,
      },
      sorting = defaults.sorting,
    }
  end,
  main = "lazyvim.util.cmp",
},
{
  "garymjr/nvim-snippets",
  opts = {
    friendly_snippets = true,
  },
  dependencies = { "rafamadriz/friendly-snippets" },
},
{ "rafamadriz/friendly-snippets" },

  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },

  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
      },
    },
  },

  -- add tsserver and setup with typescript.nvim instead of lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").lsp.on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
        end)
      end,
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- tsserver will be automatically installed with mason and loaded with lspconfig
        tsserver = {},
        bacon_ls = {
          enabled = diagnostics == "bacon-ls",
        },
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
  },
  {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      gopls = {
        settings = {
          gopls = {
            gofumpt = true,
            codelenses = {
              gc_details = false,
              generate = true,
              regenerate_cgo = true,
              run_govulncheck = true,
              test = true,
              tidy = true,
              upgrade_dependency = true,
              vendor = true,
            },
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
            analyses = {
              nilness = true,
              unusedparams = true,
              unusedwrite = true,
              useany = true,
            },
            usePlaceholders = true,
            completeUnimported = true,
            staticcheck = true,
            directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
            semanticTokens = true,
          },
        },
      },
    },
    setup = {
      gopls = function(_, opts)
        -- workaround for gopls not supporting semanticTokensProvider
        -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
        LazyVim.lsp.on_attach(function(client, _)
          if not client.server_capabilities.semanticTokensProvider then
            local semantic = client.config.capabilities.textDocument.semanticTokens
            client.server_capabilities.semanticTokensProvider = {
              full = true,
              legend = {
                tokenTypes = semantic.tokenTypes,
                tokenModifiers = semantic.tokenModifiers,
              },
              range = true,
            }
          end
        end, "gopls")
        -- end workaround
      end,
    },
  },
  },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "rust",
        "ron",
        "go",
        "gomod",
        "gowork",
        "gosum",
      },
    },
  },

  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
      })
    end,
  },

  -- the opts function can also be used to change the default opts:
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, {
        function()
          return "😄"
        end,
      })
    end,
  },

  -- or you can return new options to override all the defaults
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        --[[add your custom lualine config here]]
      }
    end,
  },

  -- add any tools you want to have installed below
  
  -- {
  --   "milanglacier/minuet-ai.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require("minuet").setup({
  --       provider = "gemini",
  --       provider_options = {
  --         gemini = {
  --           model = "gemini-2.5-flash-preview-04-17",
  --           api_key = vim.env.GEMINI_API_KEY,
  --           stream = true,
  --           timeout = 30000,
  --           max_tokens = 8192,
  --           temperature = 1,
  --         },
  --       },
  --       virtualtext = {
  --         auto_trigger_ft = {},
  --         keymap = {
  --           accept = '<A-A>',
  --           accept_line = '<A-a>',
  --           accept_n_lines = '<A-z>',
  --           prev = '<A-[>',
  --           next = '<A-]>',
  --           dismiss = '<A-e>',
  --         },
  --       },
  --       lsp = {
  --         enabled_ft = { 'toml', 'lua', 'cpp' },
  --         enabled_auto_trigger_ft = { 'cpp', 'lua' },
  --       },
  --     })
  --   end,
  -- },

  -- {
  --   "olimorris/codecompanion.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   config = function()
  --     require("codecompanion").setup({
  --       strategies = {
  --         chat = {
  --           adapters = {
  --             gemini = function()
  --               return require("codecompanion.adapters").extend("gemini", {
  --                 env = {
  --                   api_key = vim.env.GEMINI_API_KEY,
  --                 },
  --               })
  --             end,
  --           },
  --         },
  --         inline = {
  --           adapters = {
  --             gemini = function()
  --               return require("codecompanion.adapters").extend("gemini", {
  --                 env = {
  --                   api_key = vim.env.GEMINI_API_KEY,
  --                 },
  --               })
  --             end,
  --           },
  --         },
  --         cmd = {
  --           adapters = {
  --             gemini = function()
  --               return require("codecompanion.adapters").extend("gemini", {
  --                 env = {
  --                   api_key = vim.env.GEMINI_API_KEY,
  --                 },
  --               })
  --             end,
  --           },
  --         },
  --       },
  --     })
  --   end,
  -- },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  { "EdenEast/nightfox.nvim" },

  {
    "maxandron/goplements.nvim",
    ft = "go",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        go = { "goimports", "gofumpt" },
      },
    },
  },

  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()',
  },
  -- {
  -- 'kiddos/gemini.nvim',
  -- config = function()
  --   require('gemini').setup()
  -- end
  -- },
  {
	'crusj/structrue-go.nvim',
    branch = "main"
  },
  {
		'edolphin-ydf/goimpl.nvim',
		requires = {
			{'nvim-lua/plenary.nvim'},
			{'nvim-lua/popup.nvim'},
			{'nvim-telescope/telescope.nvim'},
			{'nvim-treesitter/nvim-treesitter'},
		},
		config = function()
			require'telescope'.load_extension'goimpl'
		end,
	},
  {
  "olexsmir/gopher.nvim",
  ft = "go",
  -- branch = "develop"
  -- (optional) will update plugin's deps on every update
  build = function()
    vim.cmd.GoInstallDeps()
  end,
  ---@type gopher.Config
  opts = {},
  },
  {
	'crusj/hierarchy-tree-go.nvim',
	requires= 'neovim/nvim-lspconfig'
  },
  {
  "yanskun/gotests.nvim",
  ft = "go",
  config = function()
    require("gotests").setup()
  end,
  },
  {
    "Yu-Leo/gosigns.nvim",
    ft = "go",
    cmd = {"GosignsEnable", "GosignsDisable", "GosignsToggle"},
    opts = {}, -- for default options. Refer to the configuration section for custom setup.
  },
  {
    "fredrikaverpil/godoc.nvim",
    version = "*",
    dependencies = {
      { "nvim-telescope/telescope.nvim" }, -- optional
      { "folke/snacks.nvim" }, -- optional
      { "echasnovski/mini.pick" }, -- optional
      { "ibhagwan/fzf-lua" }, -- optional
      {
          "nvim-treesitter/nvim-treesitter",
          opts = {
            ensure_installed = { "go" },
          },
      },
    },
    build = "go install github.com/lotusirous/gostdsym/stdsym@latest", -- optional
    cmd = { "GoDoc" }, -- optional
    opts = {}, -- see further down below for configuration
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    cmd = "LazyDev",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "LazyVim", words = { "LazyVim" } },
        { path = "snacks.nvim", words = { "Snacks" } },
        { path = "lazy.nvim", words = { "LazyVim" } },
      },
    },
  },
  {
  'Exafunction/windsurf.vim',
  event = 'BufEnter'
  },
  {
  "Saecki/crates.nvim",
  event = { "BufRead Cargo.toml" },
  opts = {
    completion = {
      crates = {
        enabled = true,
      },
    },
    lsp = {
      enabled = true,
      actions = true,
      completion = true,
      hover = true,
    },
  },
  },
{
  "mrcjkb/rustaceanvim",
  version = vim.fn.has("nvim-0.10.0") == 0 and "^4" or false,
  ft = { "rust" },
  opts = {
    server = {
      on_attach = function(_, bufnr)
        vim.keymap.set("n", "<leader>cR", function()
          vim.cmd.RustLsp("codeAction")
        end, { desc = "Code Action", buffer = bufnr })
        vim.keymap.set("n", "<leader>dr", function()
          vim.cmd.RustLsp("debuggables")
        end, { desc = "Rust Debuggables", buffer = bufnr })
      end,
      default_settings = {
        -- rust-analyzer language server configuration
        ["rust-analyzer"] = {
          cargo = {
            allFeatures = true,
            loadOutDirsFromCheck = true,
            buildScripts = {
              enable = true,
            },
          },
          -- Add clippy lints for Rust if using rust-analyzer
          checkOnSave = diagnostics == "rust-analyzer",
          -- Enable diagnostics if using rust-analyzer
          diagnostics = {
            enable = diagnostics == "rust-analyzer",
          },
          procMacro = {
            enable = true,
            ignored = {
              ["async-trait"] = { "async_trait" },
              ["napi-derive"] = { "napi" },
              ["async-recursion"] = { "async_recursion" },
            },
          },
          files = {
            excludeDirs = {
              ".direnv",
              ".git",
              ".github",
              ".gitlab",
              "bin",
              "node_modules",
              "target",
              "venv",
              ".venv",
            },
          },
        },
      },
    },
  },
  config = function(_, opts)
    if LazyVim.has("mason.nvim") then
      local package_path = require("mason-registry").get_package("codelldb"):get_install_path()
      local codelldb = package_path .. "/extension/adapter/codelldb"
      local library_path = package_path .. "/extension/lldb/lib/liblldb.dylib"
      local uname = io.popen("uname"):read("*l")
      if uname == "Linux" then
        library_path = package_path .. "/extension/lldb/lib/liblldb.so"
      end
      opts.dap = {
        adapter = require("rustaceanvim.config").get_codelldb_adapter(codelldb, library_path),
      }
    end
    vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
    if vim.fn.executable("rust-analyzer") == 0 then
      LazyVim.error(
        "**rust-analyzer** not found in PATH, please install it.\nhttps://rust-analyzer.github.io/",
        { title = "rustaceanvim" }
      )
    end
  end,
  },
  {
  "nvim-neotest/neotest",
  optional = true,
  dependencies = {
    "fredrikaverpil/neotest-golang",
  },
  opts = {
    adapters = {
      ["rustaceanvim.neotest"] = {},
      ["neotest-golang"] = {
        -- Here we can set options for neotest-golang, e.g.
        -- go_test_args = { "-v", "-race", "-count=1", "-timeout=60s" },
        dap_go_enabled = true, -- requires leoluz/nvim-dap-go
      },
    },
  },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "goimports",
        "gofumpt",
        "gomodifytags",
        "impl",
        "delve",
        "codelldb",
        "bacon",
      },
      formatters_by_ft = {
        go = { "goimports", "gofumpt" },
      },
    },
  },
  {
  "leoluz/nvim-dap-go",
  opts = {},
  },
  {
  "echasnovski/mini.icons",
  opts = {
    file = {
      [".go-version"] = { glyph = "", hl = "MiniIconsBlue" },
    },
    filetype = {
      gotmpl = { glyph = "󰟓", hl = "MiniIconsGrey" },
    },
  },
  },
  {
  "mfussenegger/nvim-dap",
  optional = true,
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = { ensure_installed = { "delve" } },
    },
    {
      "leoluz/nvim-dap-go",
      opts = {},
    },
  },
  },
  {
    "simrat39/rust-tools.nvim",
    enabled = true,
    lazy = true,
    opts = function()
      local ok, mason_registry = pcall(require, "mason-registry")

      local adapter ---@type any
      if ok then
        -- rust tools configuration for debugging support
        local codelldb = mason_registry.get_package("codelldb")
        local extension_path = codelldb:get_install_path() .. "/extension/"
        local codelldb_path = extension_path .. "adapter/codelldb"
        local liblldb_path = ""
        if vim.loop.os_uname().sysname:find("Windows") then
          liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
        elseif vim.fn.has("mac") == 1 then
          liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
        else
          liblldb_path = extension_path .. "lldb/lib/liblldb.so"
        end
        adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
      end
      return {
        dap = {
          adapter = adapter,
        },
        tools = {
          on_initialized = function()
            vim.cmd([[
                augroup RustLSP
                  autocmd CursorHold                      *.rs silent! lua vim.lsp.buf.document_highlight()
                  autocmd CursorMoved,InsertEnter         *.rs silent! lua vim.lsp.buf.clear_references()
                  autocmd BufEnter,CursorHold,InsertLeave *.rs silent! lua vim.lsp.codelens.refresh()
                augroup END
              ]])
          end,
        },
      }
    end,

    config = function() end,
  },
  {
    "rouge8/neotest-rust",
  },
}
