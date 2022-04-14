local treesitter_configs = require("nvim-treesitter.configs")

treesitter_configs.setup({
   -- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
   ensure_installed = {
      "bash",
      "c",
      "c_sharp",
      "cmake",
      "comment",
      "cpp",
      "css",
      "dockerfile",
      "fish",
      "go",
      "gomod",
      "gowork",
      "hcl",
      "help",
      "html",
      "http",
      "java",
      "javascript",
      "json",
      "latex",
      "lua",
      "make",
      "markdown",
      "nix",
      "python",
      "regex",
      "ruby",
      "rust",
      "toml",
      "typescript",
      "vim",
      "yaml",
   },

   highlight = { enable = true },

   -- Disabled for now as it's still pretty buggy in Go
   indent = { enable = false },

   -- FIXME: Integrate theme colors
   rainbow = { enable = false },
})
