local M = {
  'JuanZoran/Trans.nvim',
  event = 'VeryLazy',
  dependencies = {
    { "kkharji/sqlite.lua" },
  },
  keys = {
    {
      '<leader>w',
      mode = { "n", "v" },
      function()
        vim.cmd('Translate')
      end,
      desc = ' Trans ',
    },
    {
      ',',
      mode = { "n", "v" },
      function()
        vim.cmd('TransPlay')
      end,
      desc = ' play ',
    },
  },
}

function M.config()
  require 'Trans'.setup {
    dir      = require 'Trans'.plugin_dir,
    debug    = false,
    theme    = 'default', -- default | tokyonight | dracula
    strategy = {
      default = {
        frontend = 'hover',
        backend = '*',
      },
    },
    frontend = {
      default = {
        query     = 'fallback',
        border    = 'rounded',
        title     = vim.fn.has 'nvim-0.9' == 1 and {
          { '',       'TransTitleRound' },
          { ' Trans', 'TransTitle' },
          { '',       'TransTitleRound' },
        } or nil,
        auto_play = true,
        animation = {
          open = 'slid',
          close = 'slid',
          interval = 8,
        },
        timeout   = 500,
      },
      hover = {
        width             = 37,
        height            = 27,
        spinner           = 'dots',
        fallback_message  = '{{notfound}} 没有找到相关的翻译',
        auto_resize       = true,
        split_width       = 60,
        padding           = 10,
        keymaps           = {
          pageup   = '<C-u>',
          pagedown = '<C-d>',
          pin      = '<C-0>',
          close    = '<C-]>',
          -- close        = '<leader>]',
          -- toggle_entry = '<leader>;',
          -- play         = '<leader><leader>', -- Deprecated
        },
        auto_close_events = {
          'InsertEnter',
          'CursorMoved',
          'BufLeave',
        },
        order             = {
          default = {
            'str',
            'translation',
            'definition',
          },
          offline = {
            'title',
            'tag',
            'pos',
            'exchange',
            'translation',
            -- 'definition',
          },
          youdao = {
            'title',
            'translation',
            'definition',
            'web',
          },
        },
        icon              = {
          -- or use emoji
          list        = '◉',
          star        = '',
          notfound    = ' ',
          yes         = '✔',
          no          = '✖',
          cell        = '■',
          web         = '󰖟',
          tag         = '',
          pos         = '',
          exchange    = '',
          definition  = '󰗊',
          translation = '󰊿',
        },
      },
    },
  }
end

return M
