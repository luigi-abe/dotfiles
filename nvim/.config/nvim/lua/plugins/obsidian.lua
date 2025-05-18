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
      vim.api.nvim_create_autocmd("FileType", {
         pattern = "markdown",
         callback = function()
            vim.opt_local.wrap = true
            vim.opt_local.linebreak = true
            vim.opt_local.conceallevel = 2

            local map = function(mode, lhs, rhs)
               vim.keymap.set(mode, lhs, rhs, { buffer = true, silent = true })
            end

            map("n", "j", "gj")
            map("n", "k", "gk")
            map("n", "0", "g0")
            map("n", "^", "g^")

            map("n", "A", "$a")
            map("n", "I", "^i")

            map("n", "$", "g$")
            map("n", "_", "g^")
            map("n", "V", "vgVV")

            map("v", "j", "gj")
            map("v", "k", "gk")
            map("v", "0", "g0")
            map("v", "^", "g^")
            map("v", "A", "$a")
            map("v", "I", "^i")
            map("v", "$", "g$")
            map("v", "_", "g^")
         end,
      })
   end,
}
