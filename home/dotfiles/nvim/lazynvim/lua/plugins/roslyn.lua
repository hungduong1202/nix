return {
  {
    "seblyng/roslyn.nvim",
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    ft = { "cs", "razor" },
    opts = {
      root_dir = function(fname)
        return require("lspconfig.util").root_pattern("*.sln")(fname)
      end,

      razor = {
        enable = true,
        cshtml = true,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        roslyn = {
          filetypes = { "cs", "razor" },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("*.sln", "*.csproj", ".git")(fname)
          end,
        },
      },
    },
  },
}
