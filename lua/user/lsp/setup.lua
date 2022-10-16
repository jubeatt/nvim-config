local status_ok, config = pcall(require, "lspconfig")
if not status_ok then
  return
end

local status_ok2, mason = pcall(require, "mason")
if not status_ok2 then
  return
end

local handler = require("user.lsp.handler")

mason.setup()
handler.setup()

-- lua
config['sumneko_lua'].setup {
  on_attach = handler.on_attach,
  capabilities = handler.capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        -- library = vim.api.nvim_get_runtime_file("", true),
        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
        [vim.fn.stdpath("config") .. "/lua"] = true,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    }
  }
}
-- TypeScript
config['tsserver'].setup {
  on_attach = handler.on_attach,
  capabilities = handler.capabilities,
}
-- Vue
config['volar'].setup {
  on_attach = handler.on_attach,
  capabilities = handler.capabilities,
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' }
}
