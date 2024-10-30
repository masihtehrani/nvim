-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup({
-- open_on_setup = true,
-- ignore_buffer_on_setup = true,
filters = {
        dotfiles = false,
	git_ignored = false,
        git_clean = false,
        no_buffer = false,
        -- custom = { 'node_modules' },
    },
})

