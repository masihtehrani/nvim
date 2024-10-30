return require('packer').startup(function(use)
 -- Configurations will go here
 use 'wbthomason/packer.nvim'
 use 'williamboman/mason.nvim'
 use 'williamboman/mason-lspconfig.nvim'
 use 'neovim/nvim-lspconfig'
 -- Hrsh7th Code Completion Suite
 use 'hrsh7th/nvim-cmp' 
 use 'hrsh7th/cmp-nvim-lsp'
 use 'hrsh7th/cmp-nvim-lua'
 use 'hrsh7th/cmp-nvim-lsp-signature-help'
 use 'hrsh7th/cmp-vsnip'                             
 use 'hrsh7th/cmp-path'                              
 use 'hrsh7th/cmp-buffer'                            
 use 'hrsh7th/vim-vsnip'
 -- File explorer tree
 use 'nvim-tree/nvim-web-devicons' -- optional, for file iconsuse
 use 'nvim-tree/nvim-tree.lua'
 -- DAP for debugging
 use 'mfussenegger/nvim-dap'
 -- UI for DAP
 use { "rcarriga/nvim-dap-ui", 
 	requires = {"mfussenegger/nvim-dap"},
	{"nvim-neotest/nvim-nio"}
 }

 -- Dracula theme for styling
 use 'Mofiqul/dracula.nvim'
 -- Treesitter
 use {
  -- recommended packer way of installing it is to run this function, copied from documentation
         'nvim-treesitter/nvim-treesitter',
      run = function()
              local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
              ts_update()
         end,

 }

-- Telescope used to fuzzy search files
 use {
   -- 'nvim-telescope/telescope.nvim', tag = '0.1.0',
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
 }

-- Lualine information / Status bar
 use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
 } 

 use {
 	"windwp/nvim-autopairs",
     config = function() require("nvim-autopairs").setup {} end
 }
 
 -- use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}

 use ({
     'nvimdev/lspsaga.nvim',
     after = 'nvim-lspconfig',
     config = function()
         require('lspsaga').setup({})
     end,
 })

 use "lukas-reineke/indent-blankline.nvim"
 
 use 'voldikss/vim-floaterm'
 
 use 'mfussenegger/nvim-lint'
 
 use{
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
   -- your configuration comes here
   -- or leave it empty to use the default settings
   -- refer to the configuration section below
  },
 }
 
 use{
 	"folke/todo-comments.nvim",
   dependencies = { "nvim-lua/plenary.nvim" },
   opts = {
     -- your configuration comes here
     -- or leave it empty to use the default settings
     -- refer to the configuration section below
   }
 }	
 
 -- golang
 use 'ray-x/go.nvim'
 use 'ray-x/guihua.lua' -- recommended if need floating window support
 use({
    'ray-x/navigator.lua',
    requires = {
        { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
        { 'neovim/nvim-lspconfig' },
    },
 })

 use {"akinsho/toggleterm.nvim", tag = '*', config = function()
   require("toggleterm").setup()
 end}

 use {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
 }

 use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
 }

  --- Add Tabby plugin
 use 'TabbyML/vim-tabby'


 use{
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',         -- required
    'nvim-telescope/telescope.nvim', -- optional
    'sindrets/diffview.nvim',        -- optional
    'ibhagwan/fzf-lua',              -- optional
  },
  config = true
 }

  -- Alpha (Dashboard)
use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
}

 use{
     "lewis6991/gitsigns.nvim",
 }

 use 'YacineDo/mc.nvim'

 use("petertriho/nvim-scrollbar")

 use 'mg979/vim-visual-multi'
 use "kevinhwang91/nvim-hlslens"

 use "nvim-pack/nvim-spectre"

 use {
  'sudormrfbin/cheatsheet.nvim',

  requires = {
    {'nvim-telescope/telescope.nvim'},
    {'nvim-lua/popup.nvim'},
    {'nvim-lua/plenary.nvim'},
  }
 }

 use({
	'mvllow/modes.nvim',
	tag = 'v0.2.0',
	config = function()
		require('modes').setup()
	end
 })

 use {
  'code-biscuits/nvim-biscuits',
  requires = {
    'nvim-treesitter/nvim-treesitter',
     run = ':TSUpdate'
  },
 }

 use {
  'tanvirtin/vgit.nvim',
  requires = {
    'nvim-lua/plenary.nvim'
  }
 }
 
 -- These optional plugins should be loaded directly because of a bug in Packer lazy loading
 use 'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
 use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
 use 'romgrk/barbar.nvim'

 use { "tamton-aquib/mpv.nvim", config=true }

end)
