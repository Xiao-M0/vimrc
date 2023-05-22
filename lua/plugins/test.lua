local M = {
  "klen/nvim-test",
  event = 'VeryLazy',
  keys = {
    {
      '<leader>t',
      mode = { "n" },
      function()
      end,
      desc = ' Test',
    },
    {
      '<leader>tt',
      mode = { "n" },
      function()
        vim.cmd('TestFile')
      end,
      desc = ' Run',
    },
    {
      '<leader>te',
      mode = { "n" },
      function()
        vim.cmd('TestEdit')
      end,
      desc = ' Edit',
    },
    {
      '<leader>tp',
      mode = { "n" },
      function()
        vim.cmd('TestLast')
      end,
      desc = ' Info',
    },
    {
      '<leader>tl',
      mode = { "n" },
      function()
        vim.cmd('TestNearest')
      end,
      desc = ' Current',
    },
    {
      '<leader>ta',
      mode = { "n" },
      function()
        vim.cmd('TestSuite')
      end,
      desc = ' All',
    },
  },
}

function M.config()
  require('nvim-test').setup({
    run = true,
    commands_create = true,
    filename_modifier = ":.",
    silent = false,
    term = "terminal",
    termOpts = {
      direction = "float",
      width = 96,
      height = 24,
      go_back = false,
      stopinsert = "auto",
      keep_one = true,
    },
    runners = {
      cs = "nvim-test.runners.dotnet",
      go = "nvim-test.runners.go-test",
      haskell = "nvim-test.runners.hspec",
      javascriptreact = "nvim-test.runners.jest",
      javascript = "nvim-test.runners.jest",
      lua = "nvim-test.runners.busted",
      python = "nvim-test.runners.pytest",
      ruby = "nvim-test.runners.rspec",
      rust = "nvim-test.runners.cargo-test",
      typescript = "nvim-test.runners.jest",
      typescriptreact = "nvim-test.runners.jest",
    }
  })
end

return M
