-- ~/.config/nvim/lua/plugins/mason-tools.lua
-- return {
--   {
--     "WhoIsSethDaniel/mason-tool-installer.nvim",
--     opts = function()
--       return {
--         ensure_installed = {
--           -- TypeScript and JavaScript LSPs
--           "typescript-language-server", -- LSP for TypeScript
--           "eslint_d", -- ESLint daemon for faster linting
--           "html-lsp", -- HTML language server
--           "css-lsp", -- CSS language server
--           "json-lsp", -- JSON language server
--
--           -- Front-end tools
--           "prettier", -- Code formatter for front-end code
--           "stylelint", -- Linter for CSS, SCSS, and other styles
--           "eslint", -- ESLint CLI tool
--           "css-variables-language-server", -- CSS variables LSP (if supported)
--           "some-sass-language-server", -- SCSS
--
--           -- Framework support
--           "vls", -- Vetur Language Server (for Vue.js development)
--           "tailwindcss-language-server", -- Tailwind CSS support
--           {
--             "angular-language-server", -- Angular language server (optional for Angular dev)
--             version = "19.0.1", -- Ensures the correct version is used
--           },
--
--           -- Other useful tools
--           "lua-language-server", -- Optional: if you need Lua support
--           "markdownlint", -- Linter for Markdown files
--           "graphql-language-service-cli", -- GraphQL support
--         },
--         auto_update = true,
--         run_on_start = true,
--       }
--     end,
--   },
-- }

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
      "volar", -- Vue (if used)
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
      "codelldb", -- Dart, Flutter, and general native debugging
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
}
