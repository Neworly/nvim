local lsps=require("lsp.langs")


return function(module)
	module.setup()

	require("mason-lspconfig")
		.setup(
	{
		ensure_installed=((function()
			local l={}
			for _,lngser in pairs(lsps)do
				l[#l+1]=lngser[1]
			end
			return l
		end)()),automatic_installation=true
	})

	for _,t in ipairs(lsps) do
		require("lspconfig")[t[1]].setup(t[2]())
	end
end
