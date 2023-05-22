local lazypath = vim.fn.stdpath('config') .. '/nvim/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '

require('lazy').setup('plugins', {
  root = vim.fn.stdpath('config') .. '/nvim/plugins',
  defaults = {
    lazy = true,
  },
  install = {
    missing = true,
    colorscheme = { 'gruvbox-material' },
  },
  ui = {
    size = { width = 0.8, height = 0.8 },
    border = 'rounded',
    icons = {
      loaded = '●',
      not_loaded = '○',
      cmd = ' ',
      config = '',
      event = '',
      ft = ' ',
      init = ' ',
      keys = ' ',
      plugin = ' ',
      runtime = ' ',
      source = ' ',
      start = '',
      task = '✔ ',
      lazy = '鈴 ',
      list = { '●', '➜', '★', '‒' },
    },
    browser = nil,
    throttle = 20,
    custom_keys = {
    },
  },
  change_detection = {
    enabled = false,
    notify = true,
  },
  checker = {
    enabled = false,
    concurrency = nil,
    notify = true,
    frequency = 3600,
  },
  performance = {
    cache = {
      enabled = true,
      path = vim.fn.stdpath('cache') .. '/lazy/cache',
      disable_events = { 'VimEnter', 'BufReadPre' },
      ttl = 3600 * 24 * 5,
    },
    reset_packpath = true,
    rtp = {
      reset = true,
      paths = {},
      disabled_plugins = {},
    },
  },
})

vim.keymap.set('n', '<leader>l', '<cmd>:Lazy<cr>')
