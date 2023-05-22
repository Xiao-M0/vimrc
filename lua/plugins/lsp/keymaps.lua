local map = vim.keymap.set
local api = vim.api
local fn = vim.fn
local cmd = vim.cmd
local lsp = vim.lsp

local theme_lsp = function(opts)
  opts = opts or {
    prompt_title = ' find',
    prompt_prefix = ' ',
    results_title = '',
    selection_caret = '➤ ',
    preview_title = '',
  }

  local theme_opts = {
    theme = "lsp",
    sorting_strategy = "ascending",
    layout_strategy = "center",
    initial_mode = "normal",
    layout_config = {
      preview_cutoff = 20,
      width = function(_, max_columns, _)
        return math.min(max_columns, 80)
      end,
    },
    border = true,
    borderchars = {
      prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
      results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
      preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    },
  }
  if opts.layout_config and opts.layout_config.prompt_position == "bottom" then
    theme_opts.borderchars = {
      prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      results = { "─", "│", "─", "│", "╭", "╮", "┤", "├" },
      preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    }
  end

  return vim.tbl_deep_extend("force", theme_opts, opts)
end

map("n", "gm",
  function()
    return require("telescope.builtin").diagnostics(theme_lsp({
      prompt_title = '󱠇 list',
      prompt_prefix = ' ',
      results_title = '',
      preview_title = ''
    }))
  end, { desc = "call" })
map('n', 'gs', lsp.buf.signature_help, { desc = 'signature' })
map('n', 'gk', function()
  local filetype = api.nvim_eval("&filetype")
  if filetype == "go" then
    lsp.buf.format { async = false, filter = function(client) return client.name ~= "tsserver" end }
    local current_view = fn.winsaveview()
    cmd([[keeppatterns %s/^\t/  /g]])
    fn.winrestview(current_view)
    cmd('w')
  else
    lsp.buf.format { async = false, filter = function(client) return client.name ~= "tsserver" end }
    cmd('w')
  end
end, { desc = 'format' })
map('n', '<leader>q', "<cmd>Mason<cr>", { desc = '  mason' })
