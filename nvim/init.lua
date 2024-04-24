require('settings')
require('keymaps')
require('plugins')
require('/plugin-config/nvim-tree')
--require('/plugin-config/colors')
vim.cmd [[autocmd BufWritePost plugins.lua PackerCompile]]
