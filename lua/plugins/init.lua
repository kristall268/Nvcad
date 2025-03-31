local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
  { 
    "folke/tokyonight.nvim",
    name = "tokyonight",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme tokyonight")
    end
  },
  -- Language Server Protocol
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "jose-elias-alvarez/null-ls.nvim",
      "stevearc/conform.nvim",
    },
   config = function()
       require("plugins.config.lsp")
   end
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
      require("plugins.config.telescope")
    end
  },

  -- File Tree
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("plugins.config.nvim-tree")
    end
  },
  {
      "folke/noice.nvim",
      event = "VeryLazy",
      dependencies = {
          "MunifTanjim/nvim",
          "rcarriga/nvim-notify",
      },
      lazy = false,
      config = function()
          require("plugins.config.noice")
      end
  },

  {
      "nvim-lualine/lualine.nvim",
      lazy = false,
      dependencies = {
          "nvim-tree/nvim-web-devicons",
      },
      config = function()
          require("plugins.config.lualine")
      end
  },
})

