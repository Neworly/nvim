local userplugins=require("plugins.user")

return function(module)
	module.startup(function(pinstall)
		pinstall{ "sainnhe/everforest" }
		pinstall{ "neovim/nvim-lspconfig" }
		pinstall{ "williamboman/mason-lspconfig.nvim" }

		pinstall{ "nvim-treesitter/nvim-treesitter" }
		pinstall{ "nvim-tree/nvim-web-devicons" }
		pinstall{ "dgox16/oldworld.nvim" }

		pinstall{ "danilo-augusto/vim-afterglow" }

		pinstall{
		  "hrsh7th/nvim-cmp",
		   requires = {
		    "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp",
		    'quangnguyen30192/cmp-nvim-ultisnips', 'hrsh7th/cmp-nvim-lua',
		    'octaltree/cmp-look', 'hrsh7th/cmp-path', 'hrsh7th/cmp-calc',
		    'f3fora/cmp-spell', 'hrsh7th/cmp-emoji'
		   }
		}


		pinstall{ "L3MON4D3/LuaSnip" }

		for i = 1, #userplugins do
		  pinstall({userplugins[i][1]})
		  if (type(userplugins[i][2])=="function")then
		  	userplugins[i][2]()
                  end
		end

	end)
end
