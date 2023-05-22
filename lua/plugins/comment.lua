local M = {
  'numToStr/Comment.nvim',
  event = 'VeryLazy',
}

function M.config()
  require('Comment').setup({
    padding = true,
    sticky = true,
    ignore = '^$',
    toggler = {
        line = '<c-_>',
        block = '<c-.>',
    },
    opleader = {
        line = '<c-_>',
        block = '<c-.>',
    },
    mappings = {
        basic = true,
        extra = false,
    },
    pre_hook = nil,
    post_hook = nil,
  })
end

return M
