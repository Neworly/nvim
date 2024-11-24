

return {

	lua=function()
		return{
			filetypes={"lua","luau"},
			settings={
				Lua={
					completion={
						callSnippet="Replace"
					},
					diagnostics={disable={"missing-fields"}}
				},
			},
		}
	end,

	astgrep=function()
		return{}
	end,

	asm=function()
		return{}
	end,

	clangd=function()
		return{}
	end,

	zls=function()
	  vim.g.zig_fmt_autosave=0
	  return{}
	end
}
