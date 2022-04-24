local lualine_ok, lualine = pcall(require, "lualine")
if not lualine_ok then
   vim.notify("Lualine not found. Statusline is disabled.", "warn")
   return
end

lualine.setup({
   options = {
      theme = "gruvbox-material",
      component_separators = "|",
      section_separators = "",
      globalstatus = true,
   },

   sections = {
      lualine_a = {
         {
            "mode",
            fmt = function(str)
               return str:sub(1, 3)
            end,
         },
      },

      lualine_b = {
         {
            "branch",
            icon = "",
         },
      },
   },
})
