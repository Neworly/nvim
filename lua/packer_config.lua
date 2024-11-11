

return function(module)
	module.startup(function(pinstall)
		pinstall{ "sainnhe/everforest" }
		pinstall{ "neovim/nvim-lspconfig" }
		pinstall{ "williamboman/mason-lspconfig.nvim" }
	end)
end
