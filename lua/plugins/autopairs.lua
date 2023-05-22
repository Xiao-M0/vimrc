local M = {
  "windwp/nvim-autopairs",
  event = 'VeryLazy',
}

function M.config()
  local npairs = require("nvim-autopairs")

  npairs.setup({
    check_ts = true,
    ts_config = {
      lua = { 'string' },
      javascript = { 'template_string' },
      java = false,
    }
  })
  require('nvim-autopairs').remove_rule('`')
end

return M
