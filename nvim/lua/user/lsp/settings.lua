local M = {}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
  virtual_text = false,
  signs = {
    active = signs,
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  }
}
vim.diagnostic.config(config)

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require('cmp_nvim_lsp').update_capabilities(M.capabilities)

M.on_attach = function(client, bufnr)
  local keymap = {
    l = {
      name = "LSP",
      r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
      a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
      f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format Code" },
      d = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Open Floating Diagnostic"},
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
