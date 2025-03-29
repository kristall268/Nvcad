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
  -- Core plugins
  require("plugins.colorsheme"),
  -- Language Server Protocol
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
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
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- File Tree
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- require("plugins.config.nvim-tree.autolaunch"),
    -- config = function()
    --   require("plugins.config.nvim-tree.tree")
    -- end
  },
  {
      "folke/noice.nvim",
      event = "VeryLazy",
      dependencies = {
          "MunifTanjim/nvim",
          "rcarriga/nvim-notify",
      },
      config = function()
          require("plugins.config.noice")
      end
  },

  {
      "nvim-lualine/lualine.nvim",
      dependencies = {
          "nvim-tree/nvim-web-devicons",
          "folke/tokyonight.nvim",
      },
      config = function()
          require("plugins.config.lualine")
      end
  },
})

