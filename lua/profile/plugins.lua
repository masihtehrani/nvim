local packer = require('packer')

packer.init {
    display = {
        open_fn = require('packer.util').float,
        prompt_border = 'double',
    }
}

local use = packer.use

packer.reset()
packer.startup(function()
    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup {
                padding = false,
            }
        end
    }
    use {
      'romgrk/barbar.nvim',
      requires = {'kyazdani42/nvim-web-devicons'}
    }
    use { 'mhartington/formatter.nvim' }
    use 'mfussenegger/nvim-lint'
    use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    }
    use({
      "glepnir/lspsaga.nvim",
      branch = "main",
      config = function()
          local saga = require("lspsaga")
  
          saga.init_lsp_saga({
              -- your configuration
          })
      end,
  })
  use {
  "folke/trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("trouble").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
  }
    use 'Yggdroot/indentLine'
    --use 'tpope/vim-fugitive'
    use  'kdheepak/lazygit.nvim'
    --use {'akinsho/git-conflict.nvim', tag = "*", config = function()
    --  require('git-conflict').setup()
    --end}
    use 'jiangmiao/auto-pairs'
    --use 'airblade/vim-gitgutter'
    use 'maxboisvert/vim-simple-complete'
    use 'NLKNguyen/papercolor-theme'
    use 'glepnir/galaxyline.nvim'
    use 'Avimitin/nerd-galaxyline'
  use {
      'ekickx/clipboard-image.nvim',
      config = function() require('clipboard-image').setup({
              default = {
                  img_dir = "img",
                  img_dir_txt = "img",
                  img_name = function()
                      vim.fn.inputsave()
                      local name = vim.fn.input('Image name: ')
                      vim.fn.inputrestore()
                      if name == nil or name == '' then
                          return os.date('%y-%m-%d-%H-%M-%S')
                      end
                      return name
                  end,
              }
          })
      end
  }
    use {
        'wbthomason/packer.nvim',
        opt = false,
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons',
        },
        tag = 'nightly',
        config = function() require('nvim-tree').setup {
                open_on_setup = true,
                open_on_tab = false,
                view = {
                    width = 30,
                    relativenumber = true,
                },
                filters = {
                    dotfiles = true,
                },
                actions = {
                    open_file = {
                        resize_window = true,
                    }
                }
            }
        end
    }
    use {
        'folke/tokyonight.nvim',
        branch = 'main',
    }
  use 'ryanoasis/vim-devicons'
  use {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup {
    }
  end
  }
  --use 'glepnir/dashboard-nvim'
  use 'hexdigest/gounit-vim'
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'nvim-treesitter/nvim-treesitter' 
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'williamboman/nvim-lsp-installer' -- auto install  :LspInstall
  use 'j-hui/fidget.nvim' --Standalone UI for nvim-lsp progress. Eye candy for the impatient.
  use({
    'weilbith/nvim-code-action-menu',
    cmd = 'CodeActionMenu',
  })
  use 'brooth/far.vim' -- search and replace plugin
  use({
  "hrsh7th/nvim-cmp",
  requires = {
    {
      "KadoBOT/cmp-plugins",
      config = function()
        require("cmp-plugins").setup({
          files = { "*.lua" }  -- default
        })
      end,
    },
  }
})
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use "rafamadriz/friendly-snippets"
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use ({"petertriho/cmp-git", requires = "nvim-lua/plenary.nvim"})
 	use ({'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'})
  use 'f3fora/cmp-spell'
  use 'uga-rosa/cmp-dictionary'
  use 'hrsh7th/cmp-nvim-lsp-document-symbol'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'dmitmel/cmp-cmdline-history'
  use "lukas-reineke/cmp-rg" --You need to have ripgrep installed. https://github.com/BurntSushi/ripgrep
  use "vappolinario/cmp-clippy"
  use 'hrsh7th/cmp-emoji'
  use 'hrsh7th/cmp-nvim-lua'
  use 'ray-x/cmp-treesitter'
  use 'pontusk/cmp-vimwiki-tags'
  use 'KadoBOT/cmp-plugins'
  use 'octaltree/cmp-look'
  use {'romgrk/fzy-lua-native', run = 'make'}
  use {'tzachar/cmp-fuzzy-buffer', requires = {'hrsh7th/nvim-cmp', 'tzachar/fuzzy.nvim'}}
  use {'tzachar/cmp-fuzzy-path', requires = {'hrsh7th/nvim-cmp', 'tzachar/fuzzy.nvim'}}
  use 'tamago324/cmp-zsh'
  use 'Shougo/deol.nvim'
-- dap is nvim debugger
  use 'leoluz/nvim-dap-go'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use 'mfussenegger/nvim-dap'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'rcarriga/cmp-dap'
  use 'nvim-telescope/telescope-dap.nvim'
end)
