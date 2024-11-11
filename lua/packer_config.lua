

return function(module)
	module.startup(function(pinstall)
		pinstall{ "sainnhe/everforest" }
		pinstall{ "neovim/nvim-lspconfig" }
		pinstall{ "williamboman/mason-lspconfig.nvim" }
		pinstall{ "nvim-treesitter/nvim-treesitter"}
		pinstall{ "nvim-tree/nvim-web-devicons"}
		pinstall{ "dgox16/oldworld.nvim"}
	end) 
end
