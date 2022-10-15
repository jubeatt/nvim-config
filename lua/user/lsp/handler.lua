local M = {}
-- set keymaps
local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  -- popup diagnostic
  vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
  -- 跳到下一個 diagnostic
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  -- 跳到前一個 diagnostic
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  -- 顯示 diagnostic 列表
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  -- 到那個 type 定義的地方
  vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
  -- 對這個 diagnostic 做事情（例如：disable line）
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  -- format 排版
  vim.keymap.set('n', '<leader>r', function() vim.lsp.buf.format { async = true } end, opts)
end

-- set highlight effect
local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_exec(
      [[
    augroup lsp_document_highlight
      autocmd! * <buffer>
      autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    augroup END
  ]]   ,
      false
    )
  end
end

M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }
  local config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
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
    },
  }
  -- set diagnostic sign icon
  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end
  -- set diagnostic config
  vim.diagnostic.config(config)
  -- add border to popup
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })
  -- add border to popup
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

M.on_attach = function(client, bufnr)
  if client.name == "tsserver" then
    client.server_capabilities.documentFormattingProvider = false
  end
  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end

return M
