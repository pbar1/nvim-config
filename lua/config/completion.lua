local cmp = require("cmp")
local lspkind = require("lspkind")
local luasnip = require("luasnip")

cmp.setup({
   snippet = {
      expand = function(args)
         luasnip.lsp_expand(args.body)
      end,
   },

   mapping = {
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm({
         behavior = cmp.ConfirmBehavior.Replace,
         select = true,
      }),
      ["<Tab>"] = function(fallback)
         if cmp.visible() then
            cmp.select_next_item()
         elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
         else
            fallback()
         end
      end,
      ["<S-Tab>"] = function(fallback)
         if cmp.visible() then
            cmp.select_prev_item()
         elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
         else
            fallback()
         end
      end,
      ["<esc>"] = cmp.mapping(function(fallback)
         if cmp.visible() then
            cmp.abort()
         else
            fallback()
         end
      end, { "i", "c" }),
   },

   sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "path" },
      { name = "emoji" },
   }),

   formatting = {
      format = lspkind.cmp_format({
         with_text = true,
         menu = {
            nvim_lsp = "[LSP]",
            luasnip = "[SNIP]",
            path = "[PATH]",
            emoji = "[EMOJI]",
         },
      }),
   },
})
