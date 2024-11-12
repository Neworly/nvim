

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
}
