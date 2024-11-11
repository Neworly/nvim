return function(module)
	module.setup()

	require("mason-lspconfig")
		.setup(
	{
		ensure_installed={
			"lua_ls",
			"clangd",
			"ast_grep",
			"asm_lsp",
		},automatic_installation=true
	})
end
