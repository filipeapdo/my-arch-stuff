-- [[ Configure which-key ]]


-- Document existing key chains
require('which-key').register {
    -- [[ from lsp.lua ]]
    ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
    ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
    -- ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
    -- ['<leader>h'] = { name = 'More git', _ = 'which_key_ignore' },
    ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
    ['<leader>f'] = { name = '[F]ind', _ = 'which_key_ignore' },
    ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
    ['<leader>F'] = { name = ' LSP ::: [F]ormat', _ = 'which_key_ignore' },

    -- [[ from onedark.lua ]]
    ['<leader>s'] = { name = '[S]tyle', _ = 'which_key_ignore' },

    -- [[ from remap.lua ]]
    ['<leader>m'] = { name = '[M]arkdown', _ = 'which_key_ignore' },
    ['<leader>p'] = { name = '[P]acker', _ = 'which_key_ignore' },
    -- ['<leader>mt'] = { name = '[T]able', _ = 'which_key_ignore' },
}
