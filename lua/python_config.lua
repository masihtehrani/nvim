require("lspconfig").diagnosticls.setup {
  filetypes = {"python"},
  init_options = {
    formatters = {
      black = {
        command = "black",
        args = {"--quiet", "-"},
        rootPatterns = {"pyproject.toml"},
      },
      formatFiletypes = {
        python = {"black"}
      }
    }
  }
}
