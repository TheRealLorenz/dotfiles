local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require('cmp_nvim_lsp').update_capabilities(M.capabilities)

M.on_attach = function(client, bufnr)
  local keymap = {
    l = {
      name = "LSP",
      r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
      a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
      f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format Code" },
      g = {
        name = "Goto",
        d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Definition" },
        D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Declaration" },
        i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Implementation" },
        r = { "<cmd>lua vim.lsp.buf.references()<CR>", "References" },
      },
      t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Type Definition" },
      h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
      s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
    }
  }
  require('which-key').register(keymap, { buffer = bufnr, prefix = "<leader>" })
end

return M
