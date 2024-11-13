
local themes=require("custom.themes")

--[[
    I promise that I won't ever touch this folder 
    as it is specifically dedicated for users like you
    
    happy config :)
]]

return {
  {"folke/lazy.nvim",function()
	-- THIS A BAD IDEA, PLEASE DON'T DO THIS.

  end},
  { "ellisonleao/gruvbox.nvim",function() 
	-- You want a specific theme allowed in the cycling?
	themes.push("gruvbox") -- THIS IS UNSAFE, PLEASE MAKE SURE THE NAME MATCHES THE THEME
  end}
}
