-- Options
local options = {
    backup = false,
    writebackup = false,
    swapfile = false,
    relativenumber = true,
    number = true,
    clipboard = "unnamedplus",
    ignorecase = true,
    undofile = true,
    undodir = string.format("%s/.undodir", vim.env.HOME),
    encoding = "UTF-8",
    --pastetoggle = "<F2>",
    shiftwidth = 2,
    expandtab = true,
    hlsearch = true,
    wrap = false,
    cursorline = true,
    pumheight = 10,
    conceallevel = 0,
    tabstop = 2,
    cmdheight = 2,
    splitright = true,
    splitbelow = true,
    termguicolors = true,
    background = "dark",
    list = true,
    mouse = 'a',
    listchars = {
        eol = "$",
        trail = "+",
        tab = "> "
    },
    --shell = "/usr/bin/zsh",
    spell = true,
    spelllang = 'en_us',
    completeopt = {'menu', 'menuone', 'noselect'},
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

--Remap space as leader key
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


-- local history
--vim.g.local_history_path = '/Users/mahm0ud/.local-history'
--vim.g.local_history_max_changes = 1000

-- Autocommands
local autocmd = vim.api.nvim_create_autocmd

local long_text_files = vim.api.nvim_create_augroup("LongTextFiles", { clear = true })
autocmd(
    {
        "BufRead", "BufNewFile"
    },
    {
        group = long_text_files,
        pattern = { '*.md', "*.txt" },
        command = "set wrap",
    }
)

-- FZF
--vim.env.FZF_DEFAULT_COMMAND = "rg --files --hidden --follow --no-ignore-vcs --fixed-strings"
--vim.env.FZF_DEFAULT_OPTS = [[--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --bind ctrl-j:down,ctrl-k:up,ctrl-h:preview-down,ctrl-l:preview-up]]

-- Emmet
-- vim.g.user_emmet_leader_key = ","

-- Gitgutter
--vim.g.gitgutter_git_executable = "/usr/local/bin/git"
-- vim.g.gitgutter_git_executable = "/usr/bin/git"

-- Dashboard
--vim.g.dashboard_default_executive = "fzf"

-- VimGo
--vim.g.go_def_mode = 'gopls'
--vim.g.go_info_mode = 'gopls'
--vim.g.go_highlight_structs = 1
--vim.g.go_highlight_methods = 1
--vim.g.go_highlight_functions = 1
--vim.g.go_highlight_function_calls = 1
--vim.g.go_highlight_function_parameters = 1
--vim.g.go_highlight_operators = 1
--vim.g.go_highlight_types = 1
--vim.g.go_highlight_fields = 1
--vim.g.go_highlight_build_constraints = 1
--vim.g.go_highlight_generate_tags = 1
--vim.g.go_highlight_format_strings = 1
--vim.g.go_highlight_variable_declarations = 1
--vim.g.go_highlight_variable_assignments = 1
--vim.g.go_auto_type_info = 1
--vim.g.go_fmt_autosave = 1
--vim.g.go_mod_fmt_autosave = 1
--vim.g.go_gopls_enabled = 1
--vim.g.go_mod_fmt_autosave = 1
--vim.g.go_imports_autosave = 1
--vim.g.go_metalinter_autosave = 0
--vim.g.go_metalinter_deadline = "5s"
--vim.g.go_gopls_gofumpt = "v:true"
--vim.g.go_fmt_command= "gofumpt"
--vim.g.go_metalinter_command = "golangci-lint"
--vim.g.go_metalinter_autosave_enabled = {all}
--vim.g.go_metalinter_enabled = {all}
--vim.g.go_metalinter_autosave_enabled = {'asciicheck','bidichk','containedctx','cyclop','deadcode','decorder','depguard','dogsled','dupl','durationcheck','errcheck','errchkjson','errname','errorlint','execinquery','exhaustive','exhaustruct','exportloopref','forbidigo','forcetypeassert','funlen','gci','gochecknoglobals','gochecknoinits','gocognit','goconst','gocritic','gocyclo','godot','godox','goerr113','gofmt','gofumpt','goheader','goimports','gomnd','gomoddirectives','gomodguard','goprintffuncname','gosec','gosimple','govet','grouper','ifshort','importas','ineffassign','ireturn','lll','maintidx','makezero','misspell','nakedret','nestif','nilnil','nlreturn','nolintlint','nonamedreturns','nosprintfhostport','paralleltest','prealloc','predeclared','promlinter','revive','staticcheck','stylecheck','tagliatelle','tenv','testpackage','thelper','typecheck','unconvert','unused','varcheck','varnamelen','whitespace','wrapcheck'}
--vim.g.go_metalinter_enabled = {'asciicheck','bidichk','containedctx','cyclop','deadcode','decorder','depguard','dogsled','dupl','durationcheck','errcheck','errchkjson','errname','errorlint','execinquery','exhaustive','exhaustruct','exportloopref','forbidigo','forcetypeassert','funlen','gci','gochecknoglobals','gochecknoinits','gocognit','goconst','gocritic','gocyclo','godot','godox','goerr113','gofmt','gofumpt','goheader','goimports','gomnd','gomoddirectives','gomodguard','goprintffuncname','gosec','gosimple','govet','grouper','ifshort','importas','ineffassign','ireturn','lll','maintidx','makezero','misspell','nakedret','nestif','nilnil','nlreturn','nolintlint','nonamedreturns','nosprintfhostport','paralleltest','prealloc','predeclared','promlinter','revive','staticcheck','stylecheck','tagliatelle','tenv','testpackage','thelper','typecheck','unconvert','unused','varcheck','varnamelen','whitespace','wrapcheck'}
--vim.g.syntastic_go_checkers = {'golint', 'govet', 'golangci-lint'}
--vim.g.go_list_type = "quickfix"

--[[
the following code alternates between the tokyonight
and papercolor colorschemes using even or odd numbers
]]
math.randomseed(os.time()) --set seed to current time
local rand = math.random(1000)

if (rand % 2 == 0) then
    --Tokyonight
    vim.g.tokyonight_style = "night"
    vim.cmd 'colorscheme tokyonight'
else
    --PaperColor
    vim.cmd 'colorscheme PaperColor'
end

-- Set barbar's options
vim.g.bufferline = {
  -- Enable/disable animations
  animation = true,

  -- Enable/disable auto-hiding the tab bar when there is a single buffer
  auto_hide = false,

  -- Enable/disable current/total tabpages indicator (top right corner)
  tabpages = true,

  -- Enable/disable close button
  closable = true,

  -- Enables/disable clickable tabs
  --  - left-click: go to buffer
  --  - middle-click: delete buffer
  clickable = true,

  -- Excludes buffers from the tabline
  exclude_ft = {'javascript'},
  exclude_name = {'package.json'},

  -- Enable/disable icons
  -- if set to 'numbers', will show buffer index in the tabline
  -- if set to 'both', will show buffer index and icons in the tabline
  icons = true,

  -- If set, the icon color will follow its corresponding buffer
  -- highlight group. By default, the Buffer*Icon group is linked to the
  -- Buffer* group (see Highlighting below). Otherwise, it will take its
  -- default value as defined by devicons.
  icon_custom_colors = false,

  -- Configure icons on the bufferline.
  icon_separator_active = '‚ñé',
  icon_separator_inactive = '‚ñé',
  icon_close_tab = 'Ôôï',
  icon_close_tab_modified = '‚óè',
  icon_pinned = 'Ô§Ç',

  -- If true, new buffers will be inserted at the start/end of the list.
  -- Default is to insert after current buffer.
  insert_at_end = false,
  insert_at_start = false,

  -- Sets the maximum padding width with which to surround each tab
  maximum_padding = 1,

  -- Sets the maximum buffer name length.
  maximum_length = 30,

  -- If set, the letters for each buffer in buffer-pick mode will be
  -- assigned based on their name. Otherwise or in case all letters are
  -- already assigned, the behavior is to assign letters in order of
  -- usability (see order below)
  semantic_letters = true,

  -- New buffer letters are assigned in this order. This order is
  -- optimal for the qwerty keyboard layout but might need adjustement
  -- for other layouts.
  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

  -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
  -- where X is the buffer number. But only a static string is accepted here.
  no_name_title = nil,
}
vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = '*',
  callback = function()
    if vim.bo.filetype == 'NvimTree' then
      require'bufferline.state'.set_offset(31, 'FileTree')
    end
  end
})

vim.api.nvim_create_autocmd('BufWinLeave', {
  pattern = '*',
  callback = function()
    if vim.fn.expand('<afile>'):match('NvimTree') then
      require'bufferline.state'.set_offset(0)
    end
  end
})
local nvim_tree_events = require('nvim-tree.events')
local bufferline_state = require('bufferline.state')

nvim_tree_events.on_tree_open(function ()
  bufferline_state.set_offset(31, "File Tree")
end)

nvim_tree_events.on_tree_close(function ()
  bufferline_state.set_offset(0)
end)
-- end barbe

-- Enable telescope fzf native
require('telescope').load_extension 'fzf'
-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}

-- Enable telescope dap
require('telescope').load_extension 'dap'

-- Telescope
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

--Add leader shortcuts
--vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers)
--vim.keymap.set('n', '<leader>sf', function()
--  require('telescope.builtin').find_files { previewer = false }
--end)
--vim.keymap.set('n', '<leader>sb', require('telescope.builtin').current_buffer_fuzzy_find)
--vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags)
--vim.keymap.set('n', '<leader>st', require('telescope.builtin').tags)
--vim.keymap.set('n', '<leader>sd', require('telescope.builtin').grep_string)
--vim.keymap.set('n', '<leader>sp', require('telescope.builtin').live_grep)
--vim.keymap.set('n', '<leader>so', function()
--  require('telescope.builtin').tags { only_current_buffer = true }
--end)
--vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles)
local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})
--
-- LSP settings

--local lsp_installer = require('nvim-lsp-installer')
--lsp_installer.on_server_ready(function(server)
--  local opts = {
--        automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
--    ui = {
--        icons = {
--            server_installed = "ø",
--            server_pending = "ø",
--            server_uninstalled = "ø"
--        }
--    },
--  }
--  server:setup(opts)
--end)
require("nvim-lsp-installer").setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
})

local lsp_defaults = {
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  ),
  on_attach = function(client, bufnr)
    vim.api.nvim_exec_autocmds('User', {pattern = 'LspAttached'})
  end
}

local lspconfig = require('lspconfig')

lspconfig.util.default_config = vim.tbl_deep_extend(
  'force',
  lspconfig.util.default_config,
  lsp_defaults
)
--local on_attach = function(_, bufnr)
--  local opts = { buffer = bufnr }
--  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
--  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
--  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
--  --vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
--  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
--  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
--  vim.keymap.set('n', '<leader>wl', function()
--    vim.inspect(vim.lsp.buf.list_workspace_folders())
--  end, opts)
--  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
--  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
--  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
--  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
--  vim.keymap.set('n', '<leader>sO', require('telescope.builtin').lsp_document_symbols, opts)
--  vim.api.nvim_buf_create_user_command(bufnr, "Format", vim.lsp.buf.formatting, {})
--end
vim.api.nvim_create_autocmd('User', {
  pattern = 'LspAttached',
  desc = 'LSP actions',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = {buffer = true}
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Displays hover information about the symbol under the cursor
    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
    bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
    bufmap('n', 'gw', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
    -- Jump to the definition
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
    -- Jump to declaration
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
    -- Lists all the implementations for the symbol under the cursor
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
    -- Jumps to the definition of the type symbol
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
    -- Lists all the references 
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
    -- Displays a function's signature information
    bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
    -- Renames all references to the symbol under the cursor
    bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
    -- Selects a code action available at the current cursor position
    bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
    bufmap('n', 'ga', '<cmd>CodeActionMenu<CR>')
    -- Show diagnostics in a floating window
    bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
    -- Move to the previous diagnostic
    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
    -- Move to the next diagnostic
    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
  end
})

require"fidget".setup{} 

-- Enable the following language servers 
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = {
  "gopls",
  "bashls",
  "dockerls",
  "cmake",
  "golangci_lint_ls",
  "marksman",
  "sqlls", -- npm i -g sql-language-server
  "jsonls", -- npm i -g vscode-langservers-extracted
  "html", -- npm i -g vscode-langservers-extracted
  "pyright", --pip install pyright
  "vimls", -- npm install -g vim-language-server
  "tsserver", -- npm install -g typescript typescript-language-server
  "remark_ls",
  "lemminx",
  "vimls",
  "yamlls",
  "cssls",
  --"dartls",
  "dotls",
  "eslint",
  "glint",
  "graphql",
  "java_language_server",
  "kotlin_language_server",
  "perlpls",
  "phpactor",
  "quick_lint_js",
  --"r_language_server",
  "rust_analyzer",
  --"solang",
  "solidity_ls",
  "sqls",
  "terraform_lsp",
  "terraformls",
  "theme_check",
  "vimls",
  "intelephense",
  "salt_ls",
  --"ansiblels",
  "puppet",
  "terraform_lsp",
}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
require('nvim-treesitter.configs').setup {
  --ensure_installed = "maintained",
  ensure_installed = {
  "bash",
  "cmake",
  "comment",
  "css",
  "dot",
  "go",
  "help",
  "hjson",
  "html",
  "java",
  "javascript",
  "jsdoc",
  "json",
  "json5",
  "latex",
  "lua",
  "lua",
  "markdown",
  "perl",
  "php",
  "phpdoc",
  "proto",
  "python",
  "regex",
  "r",
  "ruby",
  "rust",
  "scheme",
  "scss",
  "solidity",
  "toml",
  "tsx",
  "typescript",
  "vim",
  "yaml",
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      nome_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  indent = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
  },
}
require('luasnip.loaders.from_vscode').lazy_load()

local cmp = require('cmp')
local luasnip = require('luasnip')

local select_opts = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp', keyword_length = 3},
    {name = 'buffer', keyword_length = 3},
    {name = 'luasnip', keyword_length = 2},
    { name = 'vsnip' }, -- For vsnip users.
    {name = 'cmp_tabnine'},
    {name = 'git'},
    {name = 'dap'},
    {name = 'spell'},
    {name = 'path'},
    {name = 'cmdline'},
		{
			name = "dictionary",
			keyword_length = 2,
		},
    { name = 'nvim_lsp_document_symbol' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'cmdline_history' },
    { 
       name = 'fuzzy_buffer' ,
       option = {
          get_bufnrs = function()  
          local bufs = {}
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            local buftype = vim.api.nvim_buf_get_option(buf, 'buftype')
            if buftype ~= 'nofile' and buftype ~= 'prompt' then
              bufs[#bufs + 1] = buf
            end
          end
          return bufs
          end
       },
      },
    { name = 'fuzzy_path', options = {fd_timeout_msec = 1500} },
    { name = 'rg' },
    { name = 'zsh' },
    { name = 'cmp-clippy',
      option = {
        model = "EleutherAI/gpt-neo-2.7B", -- check code clippy vscode repo for options
        key = "", -- huggingface.co api key
      }
    },
    { name = 'emoji' },
    { name = 'nvim_lua' },
    { name = 'treesitter' },
    { name = 'vimwiki-tags' },
    { name = 'plugins' },
    {
        name = 'look',
        keyword_length = 2,
        option = {
            convert_case = true,
            loud = true
            --dict = '/usr/share/dict/words'
        }
    },
  },
  window = {
    documentation = cmp.config.window.bordered()
  },
  formatting = {
    fields = {'menu', 'abbr', 'kind'},
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = '?',
        luasnip = '?',
        buffer = 'Ω',
        path = '??',
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
  mapping = {
    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
    ['<Down>'] = cmp.mapping.select_next_item(select_opts),

    ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
    ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),

    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({select = true}),

    ['<C-d>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, {'i', 's'}),

    ['<C-b>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {'i', 's'}),

    ['<Tab>'] = cmp.mapping(function(fallback)
      local col = vim.fn.col('.') - 1

      if cmp.visible() then
        cmp.select_next_item(select_opts)
      elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        fallback()
      else
        cmp.complete()
      end
    end, {'i', 's'}),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(select_opts)
      else
        fallback()
      end
    end, {'i', 's'}),
  },
})
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
-- Diagnostic keymaps
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>g', vim.diagnostic.setloclist)


local dap = require('dap')

require("dapui").setup({
  icons = { expanded = "‚ñæ", collapsed = "‚ñ∏" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7"),
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position.
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = {
      -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40,
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 10,
      position = "bottom",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
  }
})

require('dap-go').setup()

  dap.adapters.go = function(callback, config)
    local stdout = vim.loop.new_pipe(false)
    local handle
    local pid_or_err
    local port = 38697
    local opts = {
      stdio = {nil, stdout},
      args = {"dap", "-l", "127.0.0.1:" .. port},
      detached = true
    }
    handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
      stdout:close()
      handle:close()
      if code ~= 0 then
        print('dlv exited with code', code)
      end
    end)
    assert(handle, 'Error running dlv: ' .. tostring(pid_or_err))
    stdout:read_start(function(err, chunk)
      assert(not err, err)
      if chunk then
        vim.schedule(function()
          require('dap.repl').append(chunk)
        end)
      end
    end)
    -- Wait for delve to start
    vim.defer_fn(
      function()
        callback({type = "server", host = "127.0.0.1", port = port})
      end,
      100)
  end
  -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
  dap.configurations.go = {
    {
      type = "go",
      name = "Debug",
      request = "launch",
      program = "${file}"
    },
    {
      type = "go",
      name = "Debug test", -- configuration for debugging test files
      request = "launch",
      mode = "test",
      program = "${file}"
    },
    -- works with go.mod packages and sub packages 
    {
      type = "go",
      name = "Debug test (go.mod)",
      request = "launch",
      mode = "test",
      program = "./${relativeFileDirname}"
    } 
}

require("nvim-dap-virtual-text").setup {
    enabled = true,                        -- enable this plugin (the default)
    enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    highlight_new_as_changed = true,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    show_stop_reason = true,               -- show stop reason when stopped for exceptions
    commented = true,                     -- prefix virtual text with comment string
    only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
    all_references = true,                -- show virtual text on all all references of the variable (not only definitions)
    filter_references_pattern = '<module', -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
    -- experimental features:
    virt_text_pos = 'eol',                 -- position of virtual text, see `:h nvim_buf_set_extmark()`
    all_frames = true,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
    virt_text_win_col = nil,                -- position the virtual text at a fixed window column (starting from the first text column) ,
                                           -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
}

	require("cmp_dictionary").setup({
		dic = {
			["*"] = { "/usr/share/dict/words" },
			["lua"] = "path/to/lua.dic",
			["javascript,typescript"] = { "path/to/js.dic", "path/to/js2.dic" },
			filename = {
				["xmake.lua"] = { "path/to/xmake.dic", "path/to/lua.dic" },
			},
			filepath = {
				["%.tmux.*%.conf"] = "path/to/tmux.dic"
			},
			spelllang = {
				en = "path/to/english.dic",
			},
		},
		-- The following are default values.
		exact = 2,
		first_case_insensitive = false,
		document = false,
		document_command = "wn %s -over",
		async = false, 
		capacity = 5,
		debug = false,
	})


