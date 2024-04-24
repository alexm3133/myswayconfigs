vim.api.nvim_create_user_command('Ps', require('packer').sync, {})

local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

map('n', '<C-s>', ':w<CR>', opts)
map('n', '<C-n>', ':NvimTreeOpen<CR>', opts)
map('n', '<C-c>', '<Plug>NERDCommenterToggle', opts)
map('v', '<C-c>', '<Plug>NERDCommenterToggle', opts)
map('n', '<silent> gd', ':<C-u>call CocActionAsync("jumpDefinition")<CR>', opts)
map('n', 'gb', ':bp<CR>', opts)
map('n', 'gf', ':bn<CR>', opts)
map('n', 'gx', ':bd<CR>', opts)
map('n', '<C-f>', ':Telescope find_files<CR>', opts)
map('n', '<C-g>', ':Telescope live_grep<CR>', opts)
map('n', '<C-p>', ':Ps<CR>', opts) 

