

local collection={"default","afterglow","oldworld"}
return {
	push=function(name)
		collection[#collection+1]=name
	end, get=function() return collection end
}
