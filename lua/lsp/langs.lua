local lspconf=require("lsp.conf")
return {
	{"lua_ls",lspconf.lua},
	{"ast_grep",lspconf.astgrep},
	{"clangd",lspconf.clangd},
	{"asm_lsp",lspconf.asm},
	{"zls",lspconf.zls},
	{"elixirls",lspconf.elixir},
	{"intelephense",lspconf.php},
	{"hls",lspconf.haskell},
	{"vtsls",lspconf.js}
}



