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


		for i = 1, #userplugins do
		  pinstall({userplugins[i][1]})
		  if (type(userplugins[i][2])=="function")then
		  	userplugins[i][2]()
                  end
		end
	end)
end



