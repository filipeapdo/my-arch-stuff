-- [[ Configure which-key ]]


-- Document existing key chains
require('which-key').add {
    -- [[ from lsp.lua ]]
    { '<leader>c', group = '[C]ode' },
    { '<leader>d', group = '[D]ocument' },
    { '<leader>r', group = '[R]ename' },
    { '<leader>f', group = '[F]ind' },
    { '<leader>w', group = '[W]orkspace' },
    { '<leader>F', group = ' LSP ::: [F]ormat' },
    { '<leader>r', group = '[R]ename' },

    -- [[ from onedark.lua ]]
    { '<leader>s', group = '[S]tyle' },

    -- [[ from remap.lua ]]
    { '<leader>m', group = '[M]arkdonw' },
    { '<leader>p', group = '[P]acker' },
}
