-- [[ Configure LSP ]]

-- Setup neovim lua configuration
require('neodev').setup()


-- Setup 'Conform' formatter
require('conform').setup({
    formatters_by_ft = {
        -- Conform will run the formatter
        markdown = { { 'prettier' } },
        --[[ lua = { 'stylua' }, ]]
        -- Conform will run multiple formatters sequentially
        --[[ python = { 'isort', 'black' }, ]]
        -- Use a sub-list to run only the first available formatter
        javascript = { { 'prettierd', 'prettier' } },
    },
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
    },
})


--[[ NOTE: Remember that lua is a real programming language,
and as such it is possible to define small helper and utility functions
so you don't have to repeat yourself many times.
In this case, we create a function that lets us more easily define mappings
specific for LSP related items.
It sets the mode, buffer and description for us each time. ]]

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

    -- Commnad ':Format' using LSP
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
    nmap('<leader>Fo', ':Format<cr>', '[F]ormat [o]nly')
    nmap('<leader>Fs', ':Format<cr>:w<cr>', '[F]ormat and [s]ave')

    -- Format on save using Conform
    vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*',
        callback = function(args)
            require('conform').format({ bufnr = args.buf })
        end,
    })
end


-- Setup Mason a LSP pluging manager
-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
require('mason').setup()
require('mason-lspconfig').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local servers = {}

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
