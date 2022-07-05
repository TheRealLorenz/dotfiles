local lspconfig = require('lspconfig')

local settings = require('user.lsp.settings')

local servers = { 'clangd', 'pyright', 'sumneko_lua', 'tsserver' }

for _, server_name in ipairs(servers) do
  local opts = {
    capabilities = settings.capabilities,
    on_attach = settings.on_attach,
  }

  local custom_module_name = string.format('user.lsp.servers.%s', server_name)
  local has_module, custom_opts = pcall(require, custom_module_name)

  if has_module then
    opts = vim.tbl_deep_extend("force", custom_opts, opts)
  end

  lspconfig[server_name].setup(opts)
end

