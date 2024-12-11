-- [[ Configure NvimTree and NvimWebDevicons ]]

require("nvim-tree").setup {
    git = {
        enable = true,
        ignore = false,
    }
}

require 'nvim-web-devicons'.setup {}
