local M = {
  "shellRaining/hlchunk.nvim",
  lazy = false
}

function M.config()
  require('hlchunk').setup({
    chunk = {
      enable = true,
      use_treesitter = true,
      chars = {
        horizontal_line = "━",
        left_top = "┏",
        vertical_line = "┃",
        left_bottom = "┗",
        right_arrow = "━",
      },
      style = "#00ffff",
    },
    indent = {
      enable = false,
      use_treesitter = true,
      chars = {
        "┃",
      },
      style = "#444444"
    },
    line_num = {
      enable = false,
    },
    blank = {
      enable = false,
    },
    context = {
      enable = false,
    }
  })
end

return M
