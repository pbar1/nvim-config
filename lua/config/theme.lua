local ok, catppuccin = pcall(require, "catppuccin")
if ok then
   catppuccin.setup({
      transparent_background = true,

      term_colors = true,

      intrgrations = {
         neotree = { enabled = true },
         which_key = true,
         barbar = true,
         ts_rainbow = true,
         lightspeed = true,
      },
   })

   vim.cmd("colorscheme catppuccin")
else
   vim.notify("Catppuccin theme not found.", "warn")
end

-- local onedark_ok, onedark = pcall(require, "onedark")
-- if onedark_ok then
--    onedark.setup({
--       toggle_style_key = "",
--    })
--    onedark.load()
--
--    -- Set default colorscheme
--    vim.cmd("colorscheme onedark")
-- end

-- Listen and sync Neovim with system appearance (ie, light/dark mode)
local dark_notify_ok, dark_notify = pcall(require, "dark_notify")
if dark_notify_ok then
   dark_notify.run()
end
