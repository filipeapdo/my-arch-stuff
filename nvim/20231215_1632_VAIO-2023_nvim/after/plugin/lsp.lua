-- [[ Configure LSP ]]


-- NOTE: Remember that lua is a real programming language, and as such it is possible
-- to define small helper and utility functions so you don't have to repeat yourself many times.
-- In this case, we create a function that lets us more easily define mappings specific
-- for LSP related items. It sets the mode, buffer and description for us each time.


--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP ::: ' .. desc
    end
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<c-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  local tb = require('telescope.builtin')
  nmap('gd', tb.lsp_definitions, '[G]oto [D]efinition')
  nmap('gr', tb.lsp_references, '[G]oto [R]eferences')
  nmap('gI', tb.lsp_implementations, '[G]oto [I]mplementation')
  nmap('<leader>D', tb.lsp_type_definitions, 'Type [D]efinition')
  nmap('<leader>ds', tb.lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', tb.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- Commnad ':Format'
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
  nmap('<leader>Fo', ':Format<cr>', '[F]ormat [o]nly')
  nmap('<leader>Fs', ':Format<cr>:w<cr>', '[F]ormat and [s]ave')
end


-- Document existing key chains
require('which-key').register {
  ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
  ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
  -- ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
  -- ['<leader>h'] = { name = 'More git', _ = 'which_key_ignore' },
  ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
  ['<leader>f'] = { name = '[F]ind', _ = 'which_key_ignore' },
  ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
  ['<leader>F'] = { name = '[F]ormat', _ = 'which_key_ignore' },
}


-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
require('mason').setup()
require('mason-lspconfig').setup()

local servers = {}

-- Setup neovim lua configuration
require('neodev').setup()


-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,
}
