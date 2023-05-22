require('config.options')
require('config.lazy')
require('config.icon')
require('config.autocmds')
-- require('costom')

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require('config.keymaps')
    require('config.highlights')
  end,
})
