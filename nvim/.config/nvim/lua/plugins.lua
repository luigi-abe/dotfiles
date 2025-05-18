return {
   -- { "github/copilot.vim" },

   { "folke/zen-mode.nvim" },

   { "junegunn/limelight.vim" },

   {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = true,
   },

   {
      "stevearc/oil.nvim",
      opts = {
         default_file_explorer = true,
         columns = {
            "icon",
         },
         view_options = {
            show_hidden = true,
         },
         buf_options = {
            buflisted = false,
            bufhidden = "hide",
         },
         win_options = {
            wrap = false,
            signcolumn = "no",
            cursorcolumn = false,
            foldcolumn = "0",
            number = true,
            relativenumber = true,
         },
         delete_hidden_buffers_after = 2000,
      },
      dependencies = { "nvim-tree/nvim-web-devicons" },
   },

   {
      "christoomey/vim-tmux-navigator",
      cmd = {
         "TmuxNavigateLeft",
         "TmuxNavigateDown",
         "TmuxNavigateUp",
         "TmuxNavigateRight",
         "TmuxNavigatePrevious",
      },
      keys = {
         { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
         { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
         { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
         { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
         { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
      },
   },

   {
      "folke/which-key.nvim",
      event = "VeryLazy",
      init = function()
         vim.o.timeout = true
         vim.o.timeoutlen = 500
      end,
   },
   {
      "rmagatti/auto-session",
      config = function()
         local auto_session = require("auto-session")

         auto_session.setup({
            auto_restore_enabled = false,
            auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
         })

         local keymap = vim.keymap

         keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" }) -- restore last workspace session for current directory
         keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" }) -- save workspace session for current working directory
      end,
   },

   {
      "kdheepak/lazygit.nvim",
      cmd = {
         "LazyGit",
         "LazyGitConfig",
         "LazyGitCurrentFile",
         "LazyGitFilter",
         "LazyGitFilterCurrentFile",
      },
      -- optional for floating window border decoration
      dependencies = {
         "nvim-lua/plenary.nvim",
      },
      -- setting the keybinding for LazyGit with 'keys' is recommended in
      -- order to load the plugin when the command is run for the first time
      keys = {
         { "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open lazy git" },
      },
   },

   {
      "echasnovski/mini.nvim",
      version = "*",
      config = function()
         require("mini.files").setup({})
      end,
   },

   {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {},
      dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.icons" },
   },
}
