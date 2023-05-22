local cmd = vim.cmd
local api = vim.api

cmd('colorscheme carbonfox')

cmd [[
  cnoremap <C-a> <Home>
  cnoremap <C-e> <End>
  cnoremap <C-f> <Right>
  cnoremap <C-b> <Left>
]]

api.nvim_create_autocmd({ "InsertLeave" }, {
  pattern = { "*.*" },
  callback = function()
    cmd("write")
    cmd("echo ' '")
  end
})
