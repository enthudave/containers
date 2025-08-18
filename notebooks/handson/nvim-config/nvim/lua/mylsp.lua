-- This on_attach function will be used by all LSP servers
local on_attach = function(client, bufnr)
  -- --- Logic specifically for the 'ts_ls' server ---
  if client.name == 'ts_ls' then
    -- 1. Forcefully disable inlay hints by removing the server's capability for it.
    client.server_capabilities.inlayHintProvider = false

    -- 2. Hide diagnostic messages (like inline errors/warnings) from ts_ls.
    -- This targets only this specific server instance.
    local namespace = vim.lsp.diagnostic.get_namespace(client.id)
    vim.diagnostic.hide(namespace, bufnr)
  end

  -- --- Logic for all servers ---
  -- This disables semantic tokens, which you had in your previous config.
  client.server_capabilities.semanticTokensProvider = nil

  -- You can add other global keymaps or settings here if you wish.
end

-- --- Server Configurations ---

-- Configuration for ts_ls
vim.lsp.config('ts_ls', {
  on_attach = on_attach,
  -- As a final guarantee, this handler intercepts the raw diagnostic data
  -- from the server and tells Neovim to do nothing with it.
  handlers = {
    ['textDocument/publishDiagnostics'] = function() end
  },
})

-- Configuration for lua_ls (uses the same on_attach)
-- The logic inside on_attach ensures inlay hints/diagnostics are not disabled for lua_ls.
vim.lsp.config('luals', {
  on_attach = on_attach,
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})
