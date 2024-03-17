-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Colorscheme : OneDark
    use 'navarasu/onedark.nvim'

    -- Statusline : LuaLine
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- Telescope
    use {
        -- need manual update on "tag"
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end
            }
        }
    }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end
    }

    -- LSP
    use {
        'neovim/nvim-lspconfig',
        requires = {
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            { 'j-hui/fidget.nvim',                opts = {} },
            { 'folke/neodev.nvim' },
            { 'stevearc/conform.nvim' },
        }
    }

    -- Autocompletion
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            { 'L3MON4D3/LuaSnip' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    -- Undo Tree
    use 'mbbill/undotree'

    -- Fugitive (Git)
    use 'tpope/vim-fugitive'

    -- "gc" to comment visual regions/lines
    -- TO-DO : move to a config file
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Useful plugin to show you pending keybinds
    -- TO-DO : move to a config file
    use {
        'folke/which-key.nvim',
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require('which-key').setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    -- Glow, for markdown preview
    use {
        'ellisonleao/glow.nvim',
        config = function()
            require('glow').setup()
        end
    }

    -- Mkdnflow, a "full" markdown (for Wikis)
    --[[ use {
        'jakewvincent/mkdnflow.nvim',
        config = function()
            require('mkdnflow').setup({
                -- Config goes here; leave blank for defaults
            })
        end
    } ]]



    -- TO-DO : checkout this plugins...
    -- Harpoon : use('theprimeagen/harpoon')
end)
