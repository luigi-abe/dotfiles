return {
   "ThePrimeagen/harpoon",
   branch = "harpoon2",
   config = function()
      local harpoon = require("harpoon")

      harpoon:setup({
         settings = {
            save_on_toggle = true,
            sync_on_ui_close = true,
         },
      })

      local list = harpoon:list()

      local addFile = function()
         list:add()
      end

      local openFileList = function()
         harpoon.ui:toggle_quick_menu(list)
      end

      local openSpecificFileObj = function(index)
         return {
            open = function()
               list:select(index)
            end,
            desc = "Harpoon: Vai al file " .. index,
         }
      end

      local keymap = vim.keymap.set
      keymap("n", "<leader>a", addFile, { desc = "Harpoon: Aggiungi file" })
      keymap("n", "<leader>h", openFileList, { desc = "Harpoon: Menu" })
      keymap("n", "<leader>1", openSpecificFileObj(1).open, { desc = openSpecificFileObj(1).desc })
      keymap("n", "<leader>2", openSpecificFileObj(2).open, { desc = openSpecificFileObj(2).desc })
      keymap("n", "<leader>3", openSpecificFileObj(3).open, { desc = openSpecificFileObj(3).desc })
      keymap("n", "<leader>4", openSpecificFileObj(4).open, { desc = openSpecificFileObj(4).desc })
   end,
}
