local wo = vim.wo
local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = 'VeryLazy',
}

function M.config()
  require 'nvim-treesitter.configs'.setup {
    ensure_installed = {},
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true
    },
    indent = {
      enable = true
    }
  }
  wo.foldmethod = 'expr'
  wo.foldexpr = 'nvim_treesitter#foldexpr()'
  wo.foldlevel = 99
end

return M
