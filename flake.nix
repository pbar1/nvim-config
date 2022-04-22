{
  description = "Neovim configuration by @pbar1";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";

    flake-compat = { url = "github:edolstra/flake-compat"; flake = false; };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.flake-utils.follows = "flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    "vim:LuaSnip" = { url = "github:L3MON4D3/LuaSnip"; flake = false; };
    "vim:alpha-nvim" = { url = "github:goolord/alpha-nvim"; flake = false; };
    "vim:barbar.nvim" = { url = "github:romgrk/barbar.nvim"; flake = false; };
    "vim:catppuccin" = { url = "github:catppuccin/nvim"; flake = false; };
    "vim:cmp-emoji" = { url = "github:hrsh7th/cmp-emoji"; flake = false; };
    "vim:cmp-nvim-lsp" = { url = "github:hrsh7th/cmp-nvim-lsp"; flake = false; };
    "vim:cmp-path" = { url = "github:hrsh7th/cmp-path"; flake = false; };
    "vim:cmp_luasnip" = { url = "github:saadparwaiz1/cmp_luasnip"; flake = false; };
    "vim:editorconfig-vim" = { url = "github:editorconfig/editorconfig-vim"; flake = false; };
    "vim:filetype.nvim" = { url = "github:nathom/filetype.nvim"; flake = false; };
    "vim:gitsigns.nvim" = { url = "github:lewis6991/gitsigns.nvim"; flake = false; };
    "vim:impatient.nvim" = { url = "github:lewis6991/impatient.nvim"; flake = false; };
    "vim:lightspeed.nvim" = { url = "github:ggandor/lightspeed.nvim"; flake = false; };
    "vim:lsp_signature.nvim" = { url = "github:ray-x/lsp_signature.nvim"; flake = false; };
    "vim:lspkind.nvim" = { url = "github:onsails/lspkind.nvim"; flake = false; };
    "vim:lualine.nvim" = { url = "github:nvim-lualine/lualine.nvim"; flake = false; };
    "vim:mini.nvim" = { url = "github:echasnovski/mini.nvim"; flake = false; };
    "vim:nui.nvim" = { url = "github:MunifTanjim/nui.nvim"; flake = false; };
    "vim:null-ls.nvim" = { url = "github:jose-elias-alvarez/null-ls.nvim"; flake = false; };
    "vim:nvim-cmp" = { url = "github:hrsh7th/nvim-cmp"; flake = false; };
    "vim:nvim-colorizer.lua" = { url = "github:norcalli/nvim-colorizer.lua"; flake = false; };
    "vim:nvim-dap" = { url = "github:mfussenegger/nvim-dap"; flake = false; };
    "vim:nvim-dap-go" = { url = "github:leoluz/nvim-dap-go"; flake = false; };
    "vim:nvim-dap-python" = { url = "github:mfussenegger/nvim-dap-python"; flake = false; };
    "vim:nvim-dap-ui" = { url = "github:rcarriga/nvim-dap-ui"; flake = false; };
    "vim:nvim-lspconfig" = { url = "github:neovim/nvim-lspconfig"; flake = false; };
    "vim:nvim-notify" = { url = "github:rcarriga/nvim-notify"; flake = false; };
    "vim:nvim-tree.lua" = { url = "github:kyazdani42/nvim-tree.lua"; flake = false; };
    "vim:nvim-web-devicons" = { url = "github:kyazdani42/nvim-web-devicons"; flake = false; };
    "vim:plenary.nvim" = { url = "github:nvim-lua/plenary.nvim"; flake = false; };
    "vim:searchbox.nvim" = { url = "github:VonHeikemen/searchbox.nvim"; flake = false; };
    "vim:spellsitter.nvim" = { url = "github:lewis6991/spellsitter.nvim"; flake = false; };
    "vim:telescope-ui-select.nvim" = { url = "github:nvim-telescope/telescope-ui-select.nvim"; flake = false; };
    "vim:telescope-zoxide" = { url = "github:jvgrootveld/telescope-zoxide"; flake = false; };
    "vim:telescope.nvim" = { url = "github:nvim-telescope/telescope.nvim"; flake = false; };
    "vim:toggleterm.nvim" = { url = "github:akinsho/toggleterm.nvim"; flake = false; };
    "vim:twilight.nvim" = { url = "github:folke/twilight.nvim"; flake = false; };
    "vim:vim-helm" = { url = "github:towolf/vim-helm"; flake = false; };
    "vim:vim-lastplace" = { url = "github:farmergreg/vim-lastplace"; flake = false; };
    "vim:vim-numbertoggle" = { url = "github:jeffkreeftmeijer/vim-numbertoggle"; flake = false; };
    "vim:vim-startuptime" = { url = "github:dstein64/vim-startuptime"; flake = false; };
    "vim:which-key.nvim" = { url = "github:folke/which-key.nvim"; flake = false; };

    # TODO: Await fix: https://github.com/simrat39/rust-tools.nvim/issues/157
    # "vim:rust-tools.nvim" = { url = "github:simrat39/rust-tools.nvim"; flake = false; };
    "vim:rust-tools.nvim" = { url = "github:Freyskeyd/rust-tools.nvim/dap_fix"; flake = false; };

    # These require special treatment (ie, compilation), so we can't load them in bulk
    "telescope-fzf-native.nvim" = { url = "github:nvim-telescope/telescope-fzf-native.nvim"; flake = false; };
  };

  outputs = { self, flake-utils, nixpkgs, neovim-nightly-overlay, ... }@inputs:
    {
      overlay = final: prev:
        let
          pkgs = import nixpkgs {
            inherit (prev) system;
            overlays = [ neovim-nightly-overlay.overlay ];
          };

          # Build Vim plugin flake inputs into a list of Nix packages
          vimPackages = with pkgs.lib; with strings; mapAttrsToList
            (n: v: pkgs.vimUtils.buildVimPluginFrom2Nix {
              name = removePrefix "vim:" n;
              src = v.outPath;
              namePrefix = "";
            })
            (filterAttrs (n: v: hasPrefix "vim:" n) inputs);

          telescopeFzfNative = pkgs.vimUtils.buildVimPluginFrom2Nix {
            name = "telescope-fzf-native.nvim";
            src = inputs."telescope-fzf-native.nvim".outPath;
            namePrefix = "";
            buildPhase = ''
              make
            '';
          };

          # TODO: Only copy *.lua files, maybe with `nix-filter`
          # Make a derivation containing only Neovim Lua config
          neovim-pbar-luaconfig = pkgs.stdenv.mkDerivation rec {
            name = "neovim-pbar-luaconfig";
            src = ./.;
            phases = "installPhase";
            installPhase = ''
              cp -r ${src} $out
            '';
          };
        in
        rec {
          # Wrap Neovim with custom plugins and config
          neovim-pbar = pkgs.neovim.override {
            viAlias = true;
            vimAlias = true;
            withNodeJs = false;

            configure = {
              packages.pbar = with pkgs.vimPlugins; {
                start = [
                  (nvim-treesitter.withPlugins (_: pkgs.tree-sitter.allGrammars))
                  telescopeFzfNative
                ] ++ vimPackages;
              };

              customRC = ''
                set runtimepath^=${neovim-pbar-luaconfig}
                luafile ${neovim-pbar-luaconfig}/init.lua
              '';
            };
          };
        };
    } //
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ self.overlay ];
        };

        containerImage = pkgs.dockerTools.buildLayeredImage {
          name = "ghcr.io/pbar1/nvim-config";
          tag = "latest";
          contents = with pkgs; [
            neovim-pbar
            bashInteractive
            fd
            ripgrep
          ];
          config = {
            Cmd = "${pkgs.neovim-pbar}/bin/nvim";
          };
        };
      in
      rec {
        packages = with pkgs; { inherit neovim-pbar; inherit containerImage; };

        defaultPackage = packages.neovim-pbar;

        apps.neovim-pbar = flake-utils.lib.mkApp { drv = packages.neovim-pbar; };

        defaultApp = apps.neovim-pbar;

        devShell = import ./shell.nix { inherit pkgs; };
      }
    );
}
