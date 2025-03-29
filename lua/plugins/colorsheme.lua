return {
    { 
        "folke/tokyonight.nvim",     
        name = "tokyonight", 
        lazy = false,   
        priority = 1000 },
    { 
        "rebelot/kanagawa.nvim",     
        name = "kanagawa",   
        priority = 1000 },
    { 
        "olimorris/onedarkpro.nvim", 
        name = "onedarkpro", 
        priority = 1000 },
    { 
        "ellisonleao/gruvbox.nvim",  
        name = "gruvbox",    
        priority = 1000 },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("plugins.config.catppuccin")
        end
    },

}
