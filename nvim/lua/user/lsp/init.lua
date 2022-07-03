local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

local servers = { 'clangd', 'pyright', 'sumneko_lua' }
for _, server_name in ipairs(servers) do
  local opts = {
    capabilities = capabilities
  }

  local custom_module_name = string.format('lua.user.lsp.servers.%s', server_name)
  local has_module, custom_opts = pcall(require, custom_module_name)

  if has_module then
    opts = vim.tbl_deep_extend("force", custom_opts, opts)
  end

  lspconfig[server_name].setup(opts)
end

