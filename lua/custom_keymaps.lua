
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

local themes={acycle={"default","afterglow","oldworld"},target=0}
setkey('n', "<F9>", function()
  themes.target=(themes.target+1)%#themes.acycle+1
  local theme=themes.acycle[themes.target]
  vim.cmd(string.format("colorscheme %s",themes.acycle[themes.target]))
  print("theme: ",theme)
end)
