local M = {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',
    'hrsh7th/vim-vsnip',
    'hrsh7th/cmp-vsnip',
  },
  enabled = true,
  lazy =false
}

function M.config()
  require('plugins.lsp.mason')
  require('plugins.lsp.lspconfig')
  require('plugins.lsp.cmp')
  require('plugins.lsp.keymaps')
end

return M
