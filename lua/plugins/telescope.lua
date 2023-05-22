local M = {
  'nvim-telescope/telescope.nvim',
  event = 'VeryLazy',
  keys = {
    {
      '<leader>f',
      function()
        vim.cmd('Telescope fd prompt_title=Find')
      end,
      desc = '  find',
    },
    {
      '<leader>F',
      function()
        vim.cmd('Telescope live_grep prompt_title=Find')
      end,
      desc = '  find',
    },
    {
      '<leader>c',
      function()
        vim.cmd('Telescope builtin prompt_title=Builtin')
      end,
      desc = ' builtin',
    },
    {
      '<leader>m',
      function()
        vim.cmd('Telescope marks prompt_title=Marks')
      end,
      desc = ' marks',
    },
    {
      '<leader>b',
      function()
        vim.cmd('Telescope git_status prompt_title=Git')
      end,
      desc = ' status',
    },
  },
}

function M.config()
local telescope = require('telescope')
local actions = require('telescope.actions')

  telescope.setup({

    pickers = {
      lsp_references     = { theme = "cursor" },
      lsp_incoming_calls = { theme = "cursor" },
      treesitter         = { theme = "cursor" },
    },
    defaults = {

      theme = "single",
      layout_strategy = "center",
      layout_config = {
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      },

      results_title='',
      sorting_strategy = 'ascending',
      prompt_prefix=' ',
      selection_caret = ' ',

          border = true,
          borderchars = {
            prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
            results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
          },

      winblend = 0,

      file_ignore_patterns = {
        'vendor/*',
        '%.lock',
        '__pycache__/*',
        '%.sqlite3',
        '%.ipynb',
        'node_modules/*',
        '%.jpg',
        '%.jpeg',
        '%.png',
        '%.svg',
        '%.otf',
        '%.ttf',
        '.git/',
        '%.webp',
        '.dart_tool/',
        '.github/',
        '.gradle/',
        '.idea/',
        '.settings/',
        '.vscode/',
        '__pycache__/',
        'build/',
        'env/',
        'gradle/',
        'node_modules/',
        'target/',
        '%.pdb',
        '%.dll',
        '%.class',
        '%.exe',
        '%.cache',
        '%.ico',
        '%.pdf',
        '%.dylib',
        '%.jar',
        '%.docx',
        '%.met',
        'smalljre_*/*',
        '.vale/',
        '%.burp',
        '%.mp4',
        '%.mkv',
        '%.rar',
        '%.zip',
        '%.7z',
        '%.tar',
        '%.bz2',
        '%.epub',
        '%.flac',
        '%.tar.gz',
      },
      mappings = {
        i = {
          ['<C-n>'] = actions.move_selection_next,
          ['<C-p>'] = actions.move_selection_previous,
          ['<Down>'] = actions.move_selection_next,
          ['<Up>'] = actions.move_selection_previous,

          ['<CR>'] = actions.select_default,
          ['<C-s>'] = actions.select_horizontal,
          ['<C-v>'] = actions.select_vertical,
          ['<C-t>'] = actions.select_tab,

          ['<C-u>'] = actions.preview_scrolling_up,
          ['<C-d>'] = actions.preview_scrolling_down,
          ['<PageUp>'] = actions.results_scrolling_up,
          ['<PageDown>'] = actions.results_scrolling_down,

          ["<tab>"] = actions.move_selection_next,
          ["<s-tab>"] = actions.move_selection_previous,
          ['<C-_>'] = actions.which_key, -- keys from pressing <C-/>

          ["<esc>"] = actions.close,
        },

        n = {
          ['<esc>'] = actions.close,
          ['<CR>'] = actions.select_default,
          ['<C-s>'] = actions.select_horizontal,
          ['<C-v>'] = actions.select_vertical,
          ['<C-t>'] = actions.select_tab,

          ["<tab>"] = actions.move_selection_next,
          ["<s-tab>"] = actions.move_selection_previous,

          ['j'] = actions.move_selection_next,
          ['k'] = actions.move_selection_previous,
          ['H'] = actions.move_to_top,
          ['M'] = actions.move_to_middle,
          ['L'] = actions.move_to_bottom,

          ['<Down>'] = actions.move_selection_next,
          ['<Up>'] = actions.move_selection_previous,
          ['gg'] = actions.move_to_top,
          ['G'] = actions.move_to_bottom,

          ['<C-u>'] = actions.preview_scrolling_up,
          ['<C-d>'] = actions.preview_scrolling_down,
          ['<PageUp>'] = actions.results_scrolling_up,
          ['<PageDown>'] = actions.results_scrolling_down,

          ['?'] = actions.which_key,
        },
      },
    },
  })
end

return M
