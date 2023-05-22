local M = {
  "akinsho/bufferline.nvim",
  lazy = false,
  dependencies = {
    {"nvim-lua/plenary.nvim"},
  },
  keys = {
    {
      '<leader>o',
      function()
        vim.cmd('BufferLineSortByTabs')
        vim.cmd('BufferLineCloseRight')
      end,
      desc = ' only',
    },
    {
      '<leader>x',
      function()
        vim.cmd('BufferLinePickClose')
      end,
      desc = ' close',
    },
  },
}

function M.config()
  require("bufferline").setup {
    options = {
      show_buffer_close_icons = false,
      max_name_length = 20,
      separator_style = { '', '' },
      indicator = {
        style = 'none'
      },
      diagnostics = "nvim_lsp",
      offsets = {{
        filetype = "neo-tree",
        text = "  Explorer",
        highlight = "BufferLineInfoSelected",
        text_align = "left",
      }},
    },
  }
end

return M
