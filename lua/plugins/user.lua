
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

		
  {"hrsh7th/nvim-cmp",function()
      requires = {
        "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp",
	'quangnguyen30192/cmp-nvim-ultisnips', 'hrsh7th/cmp-nvim-lua',
	'octaltree/cmp-look', 'hrsh7th/cmp-path', 'hrsh7th/cmp-calc',
	'f3fora/cmp-spell', 'hrsh7th/cmp-emoji'
      }

      local cmp = require("cmp")

      cmp.setup({
	snippet = {
	  -- REQUIRED - you must specify a snippet engine
	  expand = function(args)
	  -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
	  require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
          -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
	  end},
	sources = cmp.config.sources({
	  {name = "nvim_lsp"},
	  {name = "luasnip"},
	},
	{
	  {name = "buffer"},
	})
      })


    local capabilities = require('cmp_nvim_lsp').default_capabilities()
  
      require('lspconfig').clangd.setup {
	capabilities = capabilities
    }		
  end}
}
