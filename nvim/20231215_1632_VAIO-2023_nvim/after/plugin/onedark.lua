-- [[ Configure Onedark ]]


require('onedark').setup {
  style = 'cool',
  -- toggle theme style ---
  -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
  toggle_style_key = '<leader>sc',
  -- list of styles to toggle between
  toggle_style_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' },
}


-- Document existing key chains
require('which-key').register {
  ['<leader>s'] = { name = '[S]tyle', _ = 'which_key_ignore' },
}


require('onedark').load()
