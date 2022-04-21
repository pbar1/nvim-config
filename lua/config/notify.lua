local ok, notify = pcall(require, "notify")
if not ok then
   vim.notify("nvim-notify not found. Popup notifications are disabled.", "warn")
   return
end

notify.setup({
   -- Must be set to stop spam: https://github.com/rcarriga/nvim-notify/issues/69#issuecomment-1072975047
   background_colour = "#000000",
})

vim.notify = notify
