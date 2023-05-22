local M = {
  "EdenEast/nightfox.nvim",
  lazy = false,
}


function M.config()
require('nightfox').setup({
  options = {
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled",
    transparent = true,
    terminal_colors = false,
    dim_inactive = false,
    module_default = false,
    styles = {
      comments = "italic",
      conditionals = "NONE",
      constants = "NONE",
      functions = "NONE",
      keywords = "bold",
      numbers = "NONE",
      operators = "NONE",
      strings = "NONE",
      types = "italic, bold",
      variables = "NONE",
    },
    inverse = {
      match_paren = false,
      visual = false,
      search = false,
    },
  },
  palettes = {
    all = {
      red = "#df4f6d",
    },
    nordfox = {
      bg1 = "#2e3440",
      sel0 = "#3e4a5b",
      sel1 = "#4f6074",
      comment = "#60728a",
    },
    carbonfox = {
      sel0 = "#3e75aa",
      bg1 = "none",
    },
  },
  specs = {
    all = {
      syntax = {
        keyword = "magenta",
        conditional = "magenta.bright",
        number = "orange.dim",
      },
      git = {
        changed = "#f4a261",
      },
    },
    nightfox = {
      syntax = {
        operator = "orange",
      },
    },
  }
})
end

return M
