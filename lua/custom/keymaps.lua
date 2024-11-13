
localmaps={}

function setkey(m,seq,action,description)
	description=description or {}
	if(localmaps[seq] and localmaps[seq]==m)then
		print("Attempt to overwrite an already set keymap for sequence: ",seq," and mode: ",m)
		return
	end
	localmaps[seq]=m
	vim.keymap.set(m,seq,action,description)
end

local tbuiltin=require("telescope.builtin")
setkey('n',"<leader>ff",tbuiltin.find_files)
setkey('n',"<leader>fg",tbuiltin.live_grep)
setkey('n',"<leader>fb",tbuiltin.buffers)

local themes={acycle=nil,target=0}
setkey('n', "<F9>", function()
  themes.acycle=require("custom.themes").get()
  themes.target=(themes.target+1)%(#themes.acycle+1)
  themes.target=themes.target==0 and 1 or themes.target
  local theme=themes.acycle[themes.target]
  vim.cmd(("colorscheme %s"):format(theme))
  print("colorscheme: ", theme)
end)
