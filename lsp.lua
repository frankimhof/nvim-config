local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local opts = { noremap = true }

local on_attach = function(client, bufnr)
  capabilities = capabilities
  --  client.resolved_capabilities.document_formatting = false --disable native formatting capabilities
  --  client.resolved_capabilities.document_range_formatting = false --disable native formatting capabilities
  client.server_capabilities.document_formatting = false --disable native formatting capabilities
  client.server_capabilities.document_range_formatting = false --disable native formatting capabilities
  -- mappings
  vim.api.nvim_set_keymap("n", "<leader>ren", ":lua vim.ui.input({prompt = 'rename ['.. vim.fn.expand('<cword>') .. ']'}, function(input) vim.lsp.buf.rename(input) end)<CR>", opts)
  vim.api.nvim_set_keymap("n", "<leader>h", ":lua vim.lsp.buf.hover()<CR>", opts)
  --vim.api.nvim_set_keymap("n", "<leader>for", ":w<CR>|v:lua vim.lsp.buf.format()<CR>|:e<CR>", opts)
  --vim.api.nvim_set_keymap("n", "<leader>for", ":lua vim.lsp.buf.format()<CR>", opts)
  --vim.api.nvim_set_keymap("n", "<leader>for", ":w | :execute '!eslint_d --fix %' | edit<CR>", opts)
  vim.api.nvim_set_keymap("n", "<leader>d", ":lua vim.lsp.buf.definition()<CR>", opts)
  vim.api.nvim_set_keymap('n', '[t', ':lua vim.diagnostic.goto_prev()<CR>', opts) --t as in trouble
  vim.api.nvim_set_keymap('n', ']t', ':lua vim.diagnostic.goto_next()<CR>', opts) --t as in trouble
end

-- first install pnpm add -g typescript-language-server
require("typescript").setup({
  disable_commands = false, -- prevent the plugin from creating Vim commands
  debug = false, -- enable debug logging for commands
  go_to_source_definition = {
    fallback = true, -- fall back to standard LSP definition on failure
  },
  server = { -- pass options to lspconfig's setup method
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      vim.api.nvim_set_keymap("n", "<leader>toi", ":TypescriptOrganizeImports<CR>", opts)
      vim.api.nvim_set_keymap("n", "<leader>tru", ":TypescriptRemoveUnused<CR>", opts)
      vim.api.nvim_set_keymap("n", "<leader>trf", ":TypescriptRenameFile<CR>", opts)
    end,
  },
})

--previously used this plugin, but replaced it with above, because it doesn't have organizeImports available
--require("lspconfig").tsserver.setup({
--  on_attach = on_attach,
--})

require("lspconfig").rust_analyzer.setup({
  on_attach = on_attach,
})

-- first install pnpm add -g @tailwindcss/language-server
require("lspconfig").tailwindcss.setup({})

require("lspconfig").lua_ls.setup({
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace"
      }
    }
  }
})

vim.diagnostic.config({ virtual_text = false }) --disable virtual text (which is inline and not wrapping)

vim.lsp.set_log_level("off")
