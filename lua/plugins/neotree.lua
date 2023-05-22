local M = {
  'nvim-neo-tree/neo-tree.nvim',
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    { "MunifTanjim/nui.nvim" },
  },
  event = 'VeryLazy',
  keys = {
    {
      '<A-m>',
      function()
        vim.cmd('Neotree toggle')
      end,
      {},
    },
  },
}

function M.config()
  vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

  require("neo-tree").setup({
    sources = { 'filesystem' },
    close_if_last_window = true,
    popup_border_style = "single",
    enable_git_status = true,
    enable_diagnostics = true,
    sort_case_insensitive = false,
    sort_function = nil,
    default_component_configs = {
      container = {
        enable_character_fade = false
      },
      indent = {
        indent_size = 1,
        padding = 1, -- extra padding on left hand side
        -- indent guides
        with_markers = true,
        indent_marker = "│",
        last_indent_marker = "└",
        highlight = "NeoTreeFileName", -- NeoTreeIndentMarker
        with_expanders = nil,
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "",
        default = "",
        highlight = "NeoTreeFileIcon"
      },
      modified = { symbol = "", highlight = "NeoTreeModified" },
      name = { trailing_slash = false, use_git_status_colors = true, highlight = "NeoTreeFileName" },
      git_status = {
        symbols = {
          -- Change type
          added     = "",
          modified  = "",
          deleted   = "",
          renamed   = "",
          -- Status type
          untracked = "",
          ignored   = "",
          unstaged  = "",
          staged    = "",
          conflict  = "",
        }
      },
    },
    window = {
      position = "left",
      width = 35,
      mapping_options = { noremap = true, nowait = true },
      mappings = {
        ["<Tab>"] = { "toggle_node", nowait = false },
        ["<2-LeftMouse>"] = "open",
        ["O"] = "open_tabnew",
        ["o"] = "open",
        ["<cr>"] = { "toggle_preview", config = { use_float = true } },
        ["l"] = "focus_preview",
        ["S"] = "split_with_window_picker",
        ["s"] = "vsplit_with_window_picker",
        ["w"] = "open_with_window_picker",
        ["C"] = "close_node",
        ["z"] = "close_all_nodes",
        ["u"] = "expand_all_nodes",
        ["a"] = {
          "add",
          config = {
            show_path = "none" -- "none", "relative", "absolute"
          }
        },
        ["A"] = "add_directory",
        ["d"] = "delete",
        ["r"] = "rename",
        ["y"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",
        ["c"] = "copy",
        ["m"] = "move",
        ["q"] = "close_window",
        ["<esc>"] = "close_window",
        ["R"] = "refresh",
        ["?"] = "show_help",
        ["<C-h>"] = "prev_source",
        ["<C-l>"] = "next_source",
      }
    },

    nesting_rules = {},

    filesystem = {
      bind_to_cwd = false, -- true creates a 2-way binding between vim's cwd and neo-tree's root
      components = {
        name = function(config, node)
          return {
            text = string.gsub(node.name, "^.*/", ""),
            highlight = "NeoTreeFileName"
          }
        end
      },
      cwd_target = {
        sidebar = "tab",   -- sidebar is when position = left or right
        current = "window" -- current is when position = current
      },
      filtered_items = {
        visible = false,
        hide_dotfiles = true,
        hide_gitignored = true,
        hide_hidden = true, -- only works on Windows for hidden files/directories
        hide_by_name = {
          "node_modules"
        },
        hide_by_pattern = { -- uses glob style patterns
          --"*.meta",
          --"*/src/*/tsconfig.json",
        },
        always_show = { -- remains visible even if other settings would normally hide it
          ".gitignored",
        },
        never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
          --".DS_Store",
          --"thumbs.db"
        },
        never_show_by_pattern = { -- uses glob style patterns
          --".null-ls_*",
        },
      },
      follow_current_file = true,
      group_empty_dirs = false,
      hijack_netrw_behavior = "open_default",
      use_libuv_file_watcher = false,
      window = {
        mappings = {
          ["<bs>"] = "navigate_up",
          ["."] = "set_root",
          ["H"] = "toggle_hidden",
          ["/"] = "fuzzy_finder",
          ["D"] = "fuzzy_finder_directory",
          ["f"] = "filter_on_submit",
          ["<c-x>"] = "clear_filter",
          ["[g"] = "prev_git_modified",
          ["]g"] = "next_git_modified",
        }
      }
    },
  })
end

return M
