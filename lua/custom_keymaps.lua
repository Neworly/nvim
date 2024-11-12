



local localmaps={}

function setkey(m,seq,action,description)
	description=description or {}
	if(localmaps[seq] and localmaps[seq]==m)then
		print("Attempt to overwrite an already set keymap for sequence: ",seq," and mode: ",m)
		return
	end
	localmaps[seq]=m
	vim.keymap.set(m,seq,action,description)
end


setkey('n', "<leader>cd", function() 
	vim.cmd("colorscheme default")
end)

setkey('n', "<leader>ca", function() 
	vim.cmd("colorscheme afterglow")
end)


setkey('n', "<leader>co", function() 
	vim.cmd("colorscheme oldworld")
end)

