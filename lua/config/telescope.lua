local telescope_ok, telescope = pcall(require, "telescope")
if not telescope_ok then
   vim.notify("Telescope not found. Selection UI is disabled.", "warn")
   return
end

local themes = require("telescope.themes")

telescope.setup({
   extensions = {
      ["ui-select"] = {
         themes.get_dropdown({}),
      },
   },
})

telescope.load_extension("ui-select")
telescope.load_extension("fzf")
