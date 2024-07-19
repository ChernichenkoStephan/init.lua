local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
  'gopls',
  'rust_analyzer',
})

lsp.nvim_workspace()

lsp.set_preferences({
  suggest_lsp_servers = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = true,
  configure_diagnostics = true,
  cmp_capabilities = true,
  manage_nvim_cmp = true,
  call_servers = 'local',
  sign_icons = {
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = ''
  }
})

--[[
<Enter>: Confirms selection.
<Ctrl-y>: Confirms selection.
<Up>: Navigate to previous item on the list.
<Down>: Navigate to the next item on the list.
<Ctrl-p>: Navigate to previous item on the list.
<Ctrl-n>: Navigate to the next item on the list.
<Ctrl-u>: Scroll up in the item's documentation.
<Ctrl-f>: Scroll down in the item's documentation.
<Ctrl-e>: Toggles the completion.
<Ctrl-d>: Go to the next placeholder in the snippet.
<Ctrl-b>: Go to the previous placeholder in the snippet.
<Tab>: Enables completion when the cursor is inside a word. If the completion menu is visible it will navigate to the next item in the list.
<S-Tab>: When the completion menu is visible navigate to the previous item in the list.

K: Displays hover information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.hover().

gd: Jumps to the definition of the symbol under the cursor. See :help vim.lsp.buf.definition().

gD: Jumps to the declaration of the symbol under the cursor. Some servers don't implement this feature. See :help vim.lsp.buf.declaration().

gi: Lists all the implementations for the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.implementation().

go: Jumps to the definition of the type of the symbol under the cursor. See :help vim.lsp.buf.type_definition().

gr: Lists all the references to the symbol under the cursor in the quickfix window. See :help vim.lsp.buf.references().

<Ctrl-k>: Displays signature information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.signature_help(). If a mapping already exists for this key this function is not bound.

<F2>: Renames all references to the symbol under the cursor. See :help vim.lsp.buf.rename().

<F4>: Selects a code action availab
--]]

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  if client.name == "eslint" then
      vim.cmd.LspStop('eslint')
      return
  end

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})

require('mason-lspconfig').setup({
  handlers = {
    lsp.default_setup,
    tsserver = function()
      require('lspconfig').tsserver.setup({
        single_file_support = false,
        on_attach = function(client, bufnr)
          -- config here
        end
      })
    end,
  }
})
