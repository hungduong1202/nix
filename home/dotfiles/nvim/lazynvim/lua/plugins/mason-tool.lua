return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  opts = {
    ensure_installed = {
      -- === Language Servers ===
      "typescript-language-server", -- JavaScript/TypeScript
      "html-lsp", -- HTML
      "css-lsp", -- CSS
      "json-lsp", -- JSON
      "eslint-lsp", -- ESLint
      "tailwindcss-language-server", -- Tailwind CSS
      "emmet-ls", -- Emmet HTML/CSS
      "svelte-language-server", -- Svelte (if used)
      "vue-language-server", -- Vue (if used)
      "angular-language-server", -- Angular
      "graphql-language-service-cli", -- GraphQL
      "marksman", -- Markdown LSP
      -- "dart-language-server", -- Flutter/Dart language server
      "dart-debug-adapter", -- required for nvim-dap
      "yaml-language-server", -- YAML (docker-compose, CI/CD)

      -- === .NET ===
      "omnisharp",

      -- === Formatters ===
      "prettier", -- JS/TS/HTML/CSS
      "stylua", -- Lua
      "beautysh", -- Shell script
      "yamlfmt", -- YAML
      -- "dart-format", -- Dart formatter

      -- === Linters ===
      "eslint_d", -- Fast ESLint daemon
      "stylelint", -- CSS
      "markdownlint", -- Markdown
      "shellcheck", -- Shell script
      "hadolint", -- Dockerfile

      -- === Debuggers (DAP) ===
      "js-debug-adapter", -- JS/TS
      -- "codelldb", -- Dart, Flutter, and general native debugging
      "dart-debug-adapter", -- Dart/Flutter debugging

      -- === Optional Dev Tools ===
      "actionlint", -- GitHub Actions CI

      -- === Docker ===
      "dockerls", -- Dockerfile LSP
      "docker-compose-language-service", -- Docker Compose
      "bash-language-server", -- Bash/sh scripting
    },
    auto_update = false,
    run_on_start = true,
  },

  config = function(_, opts)
    require("mason-tool-installer").setup(opts)

    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup({
      automatic_installation = false,
      ensure_installed = {}, -- tránh lặp tool
    })
  end,
}
