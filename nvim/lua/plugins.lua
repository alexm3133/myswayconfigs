vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Gestor de paquetes
    --use {'rose-pine/neovim', as = 'rose-pine', config = function() require('plugin-config/rose-pine') end}
    --use {'preservim/nerdtree', cmd = 'NERDTreeToggle'}
    use 'preservim/nerdcommenter'
    use 'morhetz/gruvbox'
    --use {'dracula/vim', as = 'dracula'}
    use {'neoclide/coc.nvim', branch = 'release'}
    use 'octol/vim-cpp-enhanced-highlight'
    use 'dstein64/nvim-scrollview'
    --use {'catppuccin/nvim', as = 'catppuccin'}
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'nvim-lualine/lualine.nvim'
    use 'nvim-tree/nvim-web-devicons'
    use 'alexm3133/codeshade'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-tree/nvim-tree.lua'    
    use 'savq/melange-nvim'
    if packer_bootstrap then
        require('packer').sync()
    end
end)

