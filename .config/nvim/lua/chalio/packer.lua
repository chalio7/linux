-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Telescope fuzzy finder
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.1',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }


  use {
    'glacambre/firenvim',
    run = function() vim.fn['firenvim#install'](0) end
}

  -- Theme
  -- use({ 'rose-pine/neovim', as = 'rose-pine' })
  -- use 'Mofiqul/vscode.nvim'
use 'luisiacc/gruvbox-baby'


  --Syntax highlighting
  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = ':TSUpdate'
  }


  -- Icons for different plugins
  use 'nvim-tree/nvim-web-devicons'

  use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional
  },
}

  -- Easy comments
   use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}

--:call Toggledeadkeys() ñáéíóúü
	use("LukeSmithxyz/vimling")

-- ZenMode clears all things on the code editor, relative numbers, bars, tabs
   use {
     "folke/zen-mode.nvim",
     config = function()
       require("zen-mode").setup {}
     end
   }


-- toggle terminal
use {"akinsho/toggleterm.nvim", tag = '*', config = function()
  require("toggleterm").setup()
end}

use {"tpope/vim-surround"}

--autopairs
use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
}


  --LSP

  use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason.nvim'},           -- Optional
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},         -- Required
    {'hrsh7th/cmp-nvim-lsp'},     -- Required
    {'hrsh7th/cmp-buffer'},       -- Optional
    {'hrsh7th/cmp-path'},         -- Optional
    {'saadparwaiz1/cmp_luasnip'}, -- Optional
    {'hrsh7th/cmp-nvim-lua'},     -- Optional

    -- Snippets
   {'L3MON4D3/LuaSnip'},             -- Required
    {'rafamadriz/friendly-snippets'}, -- Optional
  }

}

end)
