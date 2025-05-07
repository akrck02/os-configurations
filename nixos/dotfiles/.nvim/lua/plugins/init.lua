vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  
  {
    'nvim-telescope/telescope-project.nvim',
    dependencies = {
        'nvim-telescope/telescope.nvim',
    },
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
   	"nvim-treesitter/nvim-treesitter",
	opts = {
   		ensure_installed = {
   			"vim", "lua", "vimdoc", "html", "css", "go", "gomod", "gowork", "gosum" 
		},
	},
   },
}


