--[[
Keymapping Modes:
  - Normal Mode = "n"
  - Insert Mode = "i"
  - Visual Mode = "v"
  - Visual Block Mode = "x"
  - Command Mode = "c"
  - Terminal Mode = "t"
--]]

local opts = {
    noremap = true, -- non-recursive mapping
    silent = true,
}

local keymap = vim.api.nvim_set_keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- remap `jj` to ESC in insert mode
--keymap("i", "jj", "<esc>", opts)

-- move between windows quicker
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("i", "<C-h>", "<Esc><C-w>h", opts)
keymap("i", "<C-j>", "<Esc><C-w>j", opts)
keymap("i", "<C-k>", "<Esc><C-w>k", opts)
keymap("i", "<C-l>", "<Esc><C-w>l", opts)

keymap("v", "<C-h>", "<Esc><C-w>h", opts)
keymap("v", "<C-j>", "<Esc><C-w>j", opts)
keymap("v", "<C-k>", "<Esc><C-w>k", opts)
keymap("v", "<C-l>", "<Esc><C-w>l", opts)

keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", opts)
keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", opts)
keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", opts)
keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", opts)

-- resize windows with arrow keys
keymap("n", "<C-S-UP>", ":resize +2<cr>", opts)
keymap("n", "<C-S-Down>", ":resize -2<cr>", opts)
keymap("n", "<C-S-Left>", ":vertical resize +2<cr>", opts)
keymap("n", "<C-S-Right>", ":vertical resize -2<cr>", opts)

keymap("n", "<leader>da", ":normal gg<s-v>Gd<cr>", opts)
keymap("n", "<leader>du", "<s-v>ggd<cr>", opts)
keymap("n", "<leader>dd", "<s-v>Gd<cr>", opts)

-- FZF
--keymap("n", "<leader>ff", ":FZF<cr>", opts)

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>er", ":NvimTreeRefresh<cr>", opts)

-- Barbar
--keymap("n", "<A-h>", ":BufferPrevious<cr>", opts)
--keymap("n", "<A-l>", ":BufferNext<cr>", opts)
--keymap("n", "<leader>Tab", ":BufferLast<cr>", opts)
--keymap("n", "<leader>c", ":BufferClose<cr>", opts)
keymap("n", "q", ":quit!<cr>", opts)
--keymap("n", "c", ":b#|bd#<cr>", opts)
--CTRL+w, v: Opens a new vertical split
--CTRL+w, s: Opens a new horizontal split
--CTRL+w, c: Closes a window but keeps the buffer
--CTRL+w, o: Closes other windows, keeps the active window only
--CTRL+w, right arrow: Moves the cursor to the window on the right
--CTRL+w, r: Moves the current window to the right
--CTRL+w, =: Makes all splits equal size

-- exit terminal with ESC
keymap("t", "<esc>", "<c-\\><c-n>:q!<esc>", opts)

-- keymap("i", "<leader>pi", "<esc>:PasteImg<cr>", opts)

-- Rust.vim
-- keymap("n", "<leader>rr", ":RustRun<cr>", opts)
-- keymap("n", "<leader>rf", ":RustFmt<cr>", opts)

-- Coc.nvim
--keymap("n", "<leader>gd", "<Plug>(coc-definition)", opts)
--keymap("n", "<leader>gy", "<Plug>(coc-type-definition)", opts)
--keymap("n", "<leader>gi", "<Plug>(coc-implementation)", opts)
--keymap("n", "<leader>gr", "<Plug>(coc-references)", opts)

-- mahmoud

-- comment
--keymap("n", "<leader>/", "v:count == 0 ? '<Plug>(comment_toggle_current_blockwise)' : '<Plug>(comment_toggle_blockwise_count)'", opts)
keymap("n", "<C-t>", ":split | resize 8 | term<CR>", opts)
--keymap("n", "<leader>r", "<Plug>(coc-rename)", opts)
--keymap("n", "<leader>Right", "<C-S-i>", opts)
--keymap("n", "<leader>Left", "<C-S-o>", opts)
-- keymap("", "", "", opts)
--
--
-- Move to previous/next
keymap('n', '<A-,>', ':BufferPrevious<CR>', opts)
keymap('n', '<A-.>', ':BufferNext<CR>', opts)
-- Re-order to previous/next
keymap('n', '<A-<>', ':BufferMovePrevious<CR>', opts)
keymap('n', '<A->>', ' :BufferMoveNext<CR>', opts)
-- Goto buffer in position...
keymap('n', '<A-1>', ':BufferGoto 1<CR>', opts)
keymap('n', '<A-2>', ':BufferGoto 2<CR>', opts)
keymap('n', '<A-3>', ':BufferGoto 3<CR>', opts)
keymap('n', '<A-4>', ':BufferGoto 4<CR>', opts)
keymap('n', '<A-5>', ':BufferGoto 5<CR>', opts)
keymap('n', '<A-6>', ':BufferGoto 6<CR>', opts)
keymap('n', '<A-7>', ':BufferGoto 7<CR>', opts)
keymap('n', '<A-8>', ':BufferGoto 8<CR>', opts)
keymap('n', '<A-9>', ':BufferGoto 9<CR>', opts)
keymap('n', '<A-0>', ':BufferLast<CR>', opts)
-- Pin/unpin buffer
keymap('n', '<A-p>', ':BufferPin<CR>', opts)
-- Close buffer
keymap('n', '<A-w>', ':BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout<CR>
-- Close commands
--                 :BufferCloseAllButCurrent<CR>
--                 :BufferCloseAllButPinned<CR>
--                 :BufferCloseAllButCurrentOrPinned<CR>
--                 :BufferCloseBuffersLeft<CR>
--                 :BufferCloseBuffersRight<CR>
-- Magic buffer-picking mode
keymap('n', '<leader>p', ':BufferPick<CR>', opts)
-- Sort automatically by...
keymap('n', '<leader>bb', ':BufferOrderByBufferNumber<CR>', opts)
keymap('n', '<leader>bd', ':BufferOrderByDirectory<CR>', opts)
keymap('n', '<leader>bl', ':BufferOrderByLanguage<CR>', opts)
keymap('n', '<leader>bw', ':BufferOrderByWindowNumber<CR>', opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

-- move line up/down
 --keymap("n", "<A-j>", ":m .+1<CR>", opts)
 --keymap("n", "<A-k>", ":m .-2<CR>",
 keymap("n", "<C-A-J>", "ddjP", opts)
 keymap("n", "<C-A-K>", "ddkP", opts)
 keymap("i", "<C-A-J>", "<Esc>:m .+1<CR>==gi", opts)
 keymap("i", "<C-A-K>", "<Esc>:m .-2<CR>==gi", opts)
 keymap("v", "<C-A-J>", ":m '>+1<CR>gv=gv   ", opts)
 keymap("v", "<C-A-K>", ":m '<-2<CR>gv=gv   ", opts)

keymap("n", "<C-U>",":redo<CR>", opts)
keymap("n", "<C-s>",":w<CR>", opts)
keymap("n", "w",":w<CR>", opts)

-- close terminal
keymap("t", "<Esc>","<C-\\><C-n>", opts)
keymap("t", ":q!","<C-\\><C-n>:q!<CR>", opts)



keymap('n', '<F5>', '<cmd>lua require"dap".continue()<CR>', opts)
keymap('n', '<F8>', '<cmd>lua require"dap".step_over()<CR>', opts)
keymap('n', '<F9>', '<cmd>lua require"dap".step_into()<CR>', opts)
keymap('n', '<F10>', '<cmd>lua require"dap".step_out()<CR>', opts)
keymap('n', '<leader>dc', '<cmd>lua require"dap".continue()<CR>', opts)
keymap('n', '<leader>do', '<cmd>lua require"dap".step_over()<CR>', opts)
keymap('n', '<leader>di', '<cmd>lua require"dap".step_into()<CR>', opts)
keymap('n', '<leader>du', '<cmd>lua require"dap".step_out()<CR>', opts)
keymap('n', 'b', '<cmd>lua require"dap".toggle_breakpoint()<CR>', opts)
keymap('n', 'B', '<cmd>lua require"dap".toggle_breakpoint()<CR>', opts)
keymap('n', '<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<CR>', opts)
keymap('n', '<leader>dB', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',opts)
keymap('n', '<leader>dp', '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',opts)
keymap('n', '<leader>dr', '<cmd>lua require"dap".repl.open()<CR>', opts)
keymap('n', '<leader>dl', '<cmd>lua require"dap".repl.run_last()<CR>', opts)

-- telescope-dap
keymap('n', '<leader>dc', '<cmd>lua require"telescope".extensions.dap.commands{}<CR>', opts)
keymap('n', '<leader>do', '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>', opts)
keymap('n', '<leader>dl', '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>',opts)
keymap('n', '<leader>dv', '<cmd>lua require"telescope".extensions.dap.variables{}<CR>', opts)
keymap('n', '<leader>df', '<cmd>lua require"telescope".extensions.dap.frames{}<CR>', opts)

-- local hitory
--keymap('n', '<F3>', ':LocalHistoryToggle<CR>', opts)

