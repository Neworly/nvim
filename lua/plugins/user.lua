
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
  end},

  {"tree-nvim/tree.nvim",function()
	require("nvim-tree").setup({
    sort = {
      sorter = "case_sensitive",
    },
    view = {
      width = 30,
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
    },
  })
  end},
  {"folke/which-key.nvim", function()
  
  end},
  
  {"nvim-lualine/lualine.nvim",function()
    require('lualine').setup({
      options = {
	theme = "horizon",
      }
    })
  end},
  {"rktjmp/lush.nvim",function()


	
  end},
  {"uloco/bluloco.nvim",function()
  
  end},

  {"sho-87/kanagawa-paper.nvim",function()

  end},
}

--[["uloco/bluloco.nvim",function()
  
  end}]]
