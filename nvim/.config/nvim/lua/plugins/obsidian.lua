return {
   "epwalsh/obsidian.nvim",
   version = "*",
   lazy = true,
   ft = "markdown",
   dependencies = {
      "nvim-lua/plenary.nvim",
   },
   config = function()
      require("obsidian").setup({
         workspaces = {
            {
               name = "luigi's valult",
               path = "/Users/luigi/Library/Mobile Documents/iCloud~md~obsidian/Documents/luigi's vault",
            },
         },
         completion = {
            nvim_cmp = true,
            min_chars = 2,
         },

         disable_frontmatter = true,

         templates = {
            subdir = "4 - templates",
            date_format = "%d-%m-%Y",
            time_format = "%H:%M:%S",
         },

         mappings = {
            -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
            ["gd"] = {
               action = function()
                  return require("obsidian").util.gf_passthrough()
               end,
               opts = { noremap = false, expr = true, buffer = true },
            },
            -- Toggle check-boxes.
            ["<leader>ch"] = {
               action = function()
                  return require("obsidian").util.toggle_checkbox()
               end,
               opts = { buffer = true },
            },
            -- Smart action depending on context, either follow link or toggle checkbox.
            ["<cr>"] = {
               action = function()
                  return require("obsidian").util.smart_action()
               end,
               opts = { buffer = true, expr = true },
            },
         },

         ui = {
            enable = false,
         },
      })
   end,
}
