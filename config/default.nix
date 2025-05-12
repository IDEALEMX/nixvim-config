{

  # Import all your configuration modules here
  imports = [ ./bufferline.nix ];

  # @plugins section
  plugins = {
    lualine.enable = true;

    # lsps, pretty self explainatory
    lsp = {
      enable = true;
      servers = {

        # c / c++
        clangd.enable = true;

	    # bash
	    bashls.enable = true;

        # haskell
	    hls.enable = true;
        hls.installGhc = true;

	    # nix
	    nixd.enable = true;

      };
    };

    cmp = {
      enable = true;
      autoEnableSources = true;
      settings = {
        sources = [
          {name = "nvim_lsp";}
          {name = "path";}
          {name = "buffer";}
        ];
        mapping = {
          "<Tab>" = "cmp.mapping.confirm({ select = true })";
	  "<C-k>" = "cmp.mapping(function(fallback) cmp.select_prev_item() end, { 'i', 's' })";
	  "<C-j>" = "cmp.mapping(function(fallback) cmp.select_next_item() end, { 'i', 's' })";
        };
      };
    };
    
  telescope.enable = true;
  treesitter.enable = true;
  };

  # vim's default diagnostic highlights
  diagnostic = {
    settings = {
      virtual_lines = {
        current_line = true;
      };
      virtual_text = false;
    };
  };

  # general settings

  #colorschemes.gruvbox.enable = true;
  colorschemes.catppuccin.enable = true;

  globals.mapleader = " ";

  # remaps
  #keymaps = [{}];

  extraConfigLua = ''
    -- numbers on the sidelines
    vim.opt.number = true
    vim.opt.relativenumber = true

    -- how many spaces does the tab add
    vim.opt.tabstop = 2
    vim.opt.shiftwidth = 2
    vim.opt.expandtab = true

    -- make the cursor always be a block
    vim.opt.guicursor = "a:block"
  '';
}
