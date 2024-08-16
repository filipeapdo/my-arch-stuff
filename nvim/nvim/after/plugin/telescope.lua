-- [[ Configure Telescope ]]


-- ? igoring C-u and C-d ?
require('telescope').setup {
    defaults = {
        i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
        },
    },
}


-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')


--  Calling requires once:
local builtin = require('telescope.builtin')
local themes = require('telescope.themes')


-- Telescope live_grep in git root
--
-- Function to find the git root directory based on the current buffer's path
local function find_git_root()
    -- Use the current buffer's path as the starting point for the git search
    local current_file = vim.api.nvim_buf_get_name(0)
    local current_dir
    local cwd = vim.fn.getcwd()
    -- If the buffer is not associated with a file, return nil
    if current_file == '' then
        current_dir = cwd
    else
        -- Extract the directory from the current file's path
        current_dir = vim.fn.fnamemodify(current_file, ':h')
    end

    -- Find the Git root directory from the current file's path
    local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]
    if vim.v.shell_error ~= 0 then
        print('Not a git repository. Searching on current working directory')
        return cwd
    end
    return git_root
end
--
-- Custom live_grep function to search in git root
local function live_grep_git_root()
    local git_root = find_git_root()
    if git_root then
        builtin.live_grep({
            search_dirs = { git_root },
        })
    end
end
vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})


-- Key Mapping
vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[F]ind recently opened files' })

vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[F]ind existing buffers' })

vim.keymap.set('n', '<leader>/', function()
    builtin.current_buffer_fuzzy_find(themes.get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = 'Fuzzily [F]ind in current buffer' })

vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = '[F]ind [G]it [F]iles' })
vim.keymap.set('n', '<leader>fG', ':LiveGrepGitRoot<cr>', { desc = '[F]ind by RipGrep on [G]it Root' })

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fh', ':Telescope find_files hidden=ture<cr>', { desc = '[F]ind [H]idden [F]iles' })
vim.keymap.set('n', '<leader>fi', ':Telescope find_files hidden=ture no_ignore=true<cr>',
    { desc = '[F]ind [I]gnored [F]iles' })

vim.keymap.set('n', '<leader>fH', builtin.help_tags, { desc = '[F]ind [H]elp' })

vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })

vim.keymap.set('n', '<leader>fr', builtin.live_grep, { desc = '[F]ind by [R]ipGrep' })

vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })

vim.keymap.set('n', '<leader>fR', builtin.resume, { desc = '[F]ind [R]esume' })
