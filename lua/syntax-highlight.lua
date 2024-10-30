require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "go", "lua", "html", "javascript" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- highlight = {
  --   -- `false` will disable the whole extension
  --   enable = true,
  --
  -- },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    use_languagetree = false,
 --    disable = function(_, bufnr)
	-- local buf_name = vim.api.nvim_buf_get_name(bufnr)
	-- local file_size = vim.api.nvim_call_function("getfsize", { buf_name })
	-- return file_size > 256 * 1024
 --    end,
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,
 },
}
