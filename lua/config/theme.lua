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
