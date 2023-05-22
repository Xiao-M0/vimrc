local M = {
  'folke/which-key.nvim',
  event = 'VeryLazy',
}

function M.config()
  require "which-key".setup({
    plugins = {
      marks = true,
      registers = true,
      spelling = {
        enabled = false,
        suggestions = 20,
      },
      presets = {
        operators = true,
        motions = true,
        text_objects = true,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
    operators = { gc = "Comments" },
    key_labels = {
      ["<space>"] = "SPC",
      ["<cr>"] = "RET",
      ["<tab>"] = "TAB",
    },
    icons = {
      breadcrumb = "",
      separator = "",
      group = "",
    },
    popup_mappings = {
      scroll_down = '<c-d>',
      scroll_up = '<c-u>',
    },
    window = {
      border = "single",
      position = "bottom",
      margin = { 5, 1, 0, 1 },
      padding = { 1, 1, 1, 1 },
      winblend = 0
    },
    layout = {
      height = { min = 4, max = 25 },
      width = { min = 10, max = 20 },
      spacing = 3,
      align = "center",
    },
    ignore_missing = false,
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
    show_help = false,
    show_keys = false,
    triggers = { "<leader>", "\\" },
    triggers_blacklist = {
      i = { "j", "k" },
      v = { "j", "k" },
    },
    disable = {
      buftypes = {},
      filetypes = { "TelescopePrompt" },
    },
  })
end

return M
