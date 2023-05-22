local M = {
  'nvim-lualine/lualine.nvim',
  lazy = false
}

function M.config()
  local lualine = require('lualine')

  local colors = {
    bg       = 'none',
    fg       = '#bbc2cf',
    yellow   = '#ECBE7B',
    cyan     = '#008080',
    darkblue = 'none',
    green    = '#98be65',
    orange   = '#FF8800',
    violet   = '#a9a1e1',
    magenta  = '#c678dd',
    blue     = '#51afef',
    red      = '#ec5f67',
    bg1      = 'none',
  }

  local conditions = {
    buffer_not_empty = function()
      return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    hide_in_width = function()
      return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
      local filepath = vim.fn.expand('%:p:h')
      local gitdir = vim.fn.finddir('.git', filepath .. ';')
      return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
  }

  -- Config
  local config = {
    options = {
      -- Disable sections and component separators
      ignore_focus = { 'neo-tree', 'nterm', 'aerial' },
      always_divide_middle = true,
      globalstatus = true,
      component_separators = '',
      section_separators = '',
      theme = {
        normal = { c = { fg = colors.fg, bg = colors.bg } },
        inactive = { c = { fg = colors.fg, bg = colors.bg } },
      },
    },
    sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      lualine_c = {},
      lualine_x = {},
    },
    inactive_sections = {},
  }

  local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
  end

  local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
  end

  ins_left {
    function()
      return ''
    end,
    color = function()
      return { fg = colors.red, bg = colors.bg1 }
    end,
    padding = { left = 0, right = 0 }, -- We don't need space before this
  }

  ins_left {
    'filetype',
    icon_only = true
  }

  ins_left {
    'filename',
    color = { fg = colors.magenta, gui = 'bold' },
    symbols = {
      modified = '+',        -- Text to show when the file is modified.
      readonly = '-',        -- Text to show when the file is non-modifiable or readonly.
      unnamed = '[No Name]', -- Text to show for unnamed buffers.
      newfile = '[New]',     -- Text to show for newly created file before first write
    }
  }

  ins_left {
    -- 文件大小
    'filesize',
    cond = conditions.buffer_not_empty,
  }
  -- ins_left { 'location' }

  ins_left {
    'progress',
    color = {
      fg = colors.fg, gui = 'bold'
    },
  }

  ins_left {
    -- Lsp
    function()
      local msg = ''
      local count = 0
      local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
      local clients = vim.lsp.get_active_clients()
      if next(clients) == nil then
        return msg
      end

      for _, client in ipairs(clients) do
        count = count + 1
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
          msg = ' ' .. client.name
        end
      end
      return (count > 1 and count .. ' ' or '') .. msg
    end,
    color = { fg = '#ec5f67', gui = 'bold' },
  }
  ins_left {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    symbols = { error = ' ', warn = ' ', info = ' ' },
    diagnostics_color = {
      color_error = { fg = colors.red },
      color_warn = { fg = colors.yellow },
      color_info = { fg = colors.cyan },
    },
  }

  -- ins_right {
  --   require("noice").api.status.search.get,
  --   cond = require("noice").api.status.search.has,
  --   color = { fg = "#ff9e64" },
  -- }

  -- ins_right {
  --   require("noice").api.status.mode.get,
  --   cond = require("noice").api.status.mode.has,
  --   color = { fg = "#ff9e64" },
  -- }

  ins_right {
    'searchcount',
    maxcount = 999,
    timeout = 500,
  }
  ins_right {
    'selectioncount',
  }

  -- Add components to right sections
  ins_right {
    'diff',
    symbols = { added = ' ', modified = ' ', removed = ' ' },
    diff_color = {
      added = { fg = colors.green },
      modified = { fg = colors.orange },
      removed = { fg = colors.red },
    },
  }

  ins_right {
    'branch',
    icon = ' :',
    color = { fg = colors.green, gui = 'bold' },
  }

  ins_right {
    'o:tabstop',
    icon = 'TAB:',
    color = { fg = colors.green, gui = 'bold' },
  }

  ins_right {
    'o:encoding', -- option component same as &encoding in viml
    fmt = string.upper,
    color = { fg = colors.green, gui = 'bold' },
  }

  ins_right {
    'fileformat',
    symbols = { unix = ' ', windows = ' ', mac = ' ' },
    color = { fg = colors.green, gui = 'bold' },
  }

  ins_right {
    function()
      return ''
    end,
    color = function()
      return { fg = colors.red, bg = colors.bg1 }
    end,
    padding = { left = 0 },
  }
  lualine.setup(config)
end

return M
