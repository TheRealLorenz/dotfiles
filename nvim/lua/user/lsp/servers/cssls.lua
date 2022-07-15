local capabilities = require("user.lsp.settings").capabilities
capabilities.textDocument.completion.completionItem.snippetSupport = true

return {
  capabilities = capabilities,
}
