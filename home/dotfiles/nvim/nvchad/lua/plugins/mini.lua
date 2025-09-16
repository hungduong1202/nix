return {
  "echasnovski/mini.nvim",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("mini.ai").setup() -- textobjects nâng cao
    require("mini.surround").setup() -- thao tác với cặp ngoặc, quotes...
    require("mini.comment").setup() -- toggle comment
    require("mini.pairs").setup() -- auto pairs
    require("mini.icons").setup() -- icon fallback (nếu muốn)
    require("mini.indentscope").setup {
      draw = {
        animation = require("mini.indentscope").gen_animation.none(),
      },
    }
  end,
}
