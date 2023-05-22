local fn = vim.fn
require('nvim-web-devicons').setup({
  override = {
    default_icon = { icon = '', name = 'Default' },
    go = { icon = '', color = '#14d5fD' },
    css = { icon = '', color = '#fc6d26' },
    html = { icon = '', color = '#dcfdd6' },
    js = { icon = '', color = '#FC6D26' },
    py = { icon = '', color = '#FC6D26' },
    toml = { icon = '', color = '#BEC0C4' },
    ts = { icon = '󰛦', color = '#6465EF' },
    md = { icon = '', color = '#ffffff' },
    vim = { icon = " ", color = "#428850" },
    sh = { icon = '', color = "#ffffff" },
    ['.gitattributes'] = { icon = '', color = '#6495ED' },
    ['.gitconfig'] = { icon = '', color = '#BEC0C4' },
    ['.gitignore'] = { icon = '', color = '#6495ED' },
    ['.gitlab-ci.yml'] = { icon = '', color = '#FC6D26' },
    ['.gitmodules'] = { icon = '', color = '#6495ED' },
    ['.lua-format'] = { icon = '', color = '#28A2D4' },
    ['.editorconfig'] = { icon = '', color = '#BEC0C4' },
    ['.eslintrc.yml'] = { icon = '', color = '#8080F2' },
    ['.prettierignore'] = { icon = '', color = '#C794C8' },
    ['svg'] = { icon = '', color = '#BEC0C4' },
    ['go.mod'] = { icon = '', color = "#BEC0C4" },
    ['go.sum'] = { icon = '', color = "#BEC0C4" },
  },
  default = true,
})

local cmp = require("cmp")
cmp.setup({
  formatting = {
    fields = { "abbr", "kind" },
    format = function(entry, vim_item)
      vim_item.abbr = string.gsub(vim_item.abbr, "%(.*%)", "()")
      vim_item.abbr = string.gsub(vim_item.abbr, "^ ", "")
      vim_item.kind = ({
        lspKind = {
          Array = "",
          Boolean = "",
          Class = "",
          Color = "",
          Constant = "",
          Constructor = "",
          Enum = "󰀎",
          EnumMember = "󰠃",
          Event = "",
          Field = "",
          File = "",
          Folder = "",
          Function = "",
          Interface = "",
          Key = "󰿂",
          Keyword = "",
          Method = "",
          Module = "",
          Namespace = "󰊱",
          Null = "󰯞",
          Number = "󰕅",
          Object = "󱜚",
          Operator = "",
          Package = "",
          Property = "",
          Reference = "",
          Snippet = "",
          String = "󰉠",
          Struct = "",
          Text = "󱎷",
          TypeParameter = "",
          Value = "",
          Variable = "",
        },
      }).lspKind[vim_item.kind]
      vim_item.menu = ({
        nvim_lsp = "",
        path = "",
        calc = "",
        buffer = "﬘",
        dictionary = "",
        vsnip = "",
        ultisnips = "",
        luasnip = "",
        emoji = "",
      })[entry.source.name]
      return vim_item
    end,
  },
})

fn.sign_define("DiagnosticSignError",
  { text = " ", texthl = "DiagnosticSignError" })
fn.sign_define("DiagnosticSignWarn",
  { text = " ", texthl = "DiagnosticSignWarn" })
fn.sign_define("DiagnosticSignInfo",
  { text = " ", texthl = "DiagnosticSignInfo" })
fn.sign_define("DiagnosticSignHint",
  { text = " ", texthl = "DiagnosticSignHint" })
