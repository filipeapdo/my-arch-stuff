-- [[ REMAPS ]]


-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })


-- Other keymaps
vim.keymap.set('n', '<leader>E', vim.cmd.Ex, { desc = 'Go to [E]xplorer' })
vim.keymap.set('n', '<leader>mp', vim.cmd.Glow, { desc = 'Open Glow, markdown [P]review' })
vim.keymap.set('n', '<leader>mtf', vim.cmd.MkdnTableFormat, { desc = '[F]ormat markdown table' })

-- ThePrimeagen ones
vim.keymap.set('v', 'J', [[:m '>+1<cr>gv=gv]], { desc = 'move highlighted text down' })
vim.keymap.set('v', 'K', [[:m '<-2<cr>gv=gv]], { desc = 'move highlighted text up' })

vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'append the next line without move the cursor' })
vim.keymap.set('n', '<c-d>', '<c-d>zz', { desc = 'move half page down and maintain the cursor centered' })
vim.keymap.set('n', '<c-u>', '<c-u>zz', { desc = 'move half page up and maintain the cursor centered' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'go to next search term and maintain the cursor centered' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'go to previous search term and maintain the cursor centered' })

vim.keymap.set('x', '<leader>p', [["_dP]], { desc = '[P]aste and maintain last copied text' })

vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]], { desc = '[Y]ank to clipboard' })
vim.keymap.set('n', '<leader>Y', [["+Y]], { desc = '[Y]ank line to clipboard' })
-- vim.keymap.set({"n", "v"}, "<leader>d", [["_d]], { desc = '[D]elete to clipboard' })

vim.keymap.set('n', '<leader>S', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gc<Left><Left><Left>]],
  { desc = '[S]earch and replace the current word' })

vim.keymap.set('n', '<leader>pu', [[:e ~/.config/nvim/lua/filipus/packer.lua<cr>:so<cr>:PackerSync<cr>]],
  { desc = '[U]pdate' })


-- Document existing key chains
require('which-key').register {
  ['<leader>m'] = { name = '[M]arkdown', _ = 'which_key_ignore' },
  ['<leader>p'] = { name = '[P]acker', _ = 'which_key_ignore' },
  ['<leader>mt'] = { name = '[T]able', _ = 'which_key_ignore' }
}
