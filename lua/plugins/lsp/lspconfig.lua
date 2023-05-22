local lspconfig = require("lspconfig")
local mason_lspconnfig = require("mason-lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local utils = require("plugins.lsp.utils")
local lsp_server_config = vim.fn.stdpath("config") .. "/lua/plugins/lsp/list/"

local lsp_flags = {
  debounce_text_changes = 150,
}

local mason_lspconnfig_settings = {
  ensure_installed = {},
  automatic_installation = true,
}

mason_lspconnfig.setup(
  mason_lspconnfig_settings
)

mason_lspconnfig.setup_handlers {
  function(server_name)
    lspconfig[server_name].setup {
      on_attach = on_attach,
      flags = lsp_flags,
      capabilities = capabilities,
    }
  end,
}

for _, fname in pairs(vim.fn.readdir(lsp_server_config)) do
  if utils.ends_with(fname, ".lua") then
    local server_config_name = string.sub(fname, 1, #fname - #".lua")
    local server_config_file = "plugins.lsp.list." .. server_config_name
    mason_lspconnfig.setup_handlers {
      [server_config_name] = function()
        lspconfig[server_config_name].setup {
          on_attach = on_attach,
          flags = lsp_flags,
          capabilities = capabilities,
          settings = require(server_config_file),
        }
      end
    }
  end
end
