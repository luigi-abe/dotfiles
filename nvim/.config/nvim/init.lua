require("core")
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

require("lazy").setup("plugins", {
   checker = {
      enabled = true,
   },
   change_detection = {
      notify = false,
   },
})

vim.keymap.set("n", "<leader>ef", function()
   local MiniFiles = require("mini.files")
   local _ = MiniFiles.close() or MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
   vim.defer_fn(function()
      MiniFiles.reveal_cwd()
   end, 30)
end, { desc = "Open mini.files (root + reveal current file)" })
