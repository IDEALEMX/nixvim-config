{ pkgs, ... }: {

  # Import all your configuration modules here
  imports = [ ./bufferline.nix ];

  # @plugins section
  plugins = {

    # @cosmetic changes
    lualine.enable = true;

    # @latex stuff
    vimtex.enable = true;
    cmp-latex-symbols.enable = true;

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

  harpoon = {
    enable = true;
    settings = {
      settings = {
        save_on_toggle = true;
        sync_on_ui_close = false;
      };
    };
  };

  treesitter.enable = true;

  # @school notes

  # markdown support
  render-markdown.enable = true;

  # nice headings, checkboxes, etc.
  headlines.enable = true;

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
  keymaps = [
    # harpoon
    {
      mode = "n";
      key = "<leader>a";
      action = "<cmd>lua require('harpoon'):list():add()<CR>";
      options.desc = "Add file to Harpoon";
    }
    {
      mode = "n";
      key = "<C-e>";
      action = "<cmd>lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<CR>";
      options.desc = "Toggle Harpoon quick menu";
    }

    # telescope
    {
      mode = "n";
      key = "<leader>f";
      action = "<cmd>Telescope find_files<CR>";
      options.desc = "Find files with Telescope";
    }

    # switch buffers
    {
        mode = "n";
        key = "<C-k>";
        action = ":BufferLineCycleNext<CR>";
        options.desc = "Go to next buffer";
    }

    {
        mode = "t";
        key = "<C-k>";
        action = "<C-\\><C-n>:BufferLineCycleNext<CR>";
        options.desc = "Go to next buffer";
    }

    {
        mode = "n";
        key = "<C-j>";
        action = ":BufferLineCyclePrev<CR>";
        options.desc = "Go to previous buffer";
    }

    {
        mode = "t";
        key = "<C-j>";
        action = "<C-\\><C-n>:BufferLineCyclePrev<CR>";
        options.desc = "Go to previous buffer";
    }

    # move around buffers
    {
        mode = "n";
        key = "<C-l>";
        action = ":BufferLineMoveNext<CR>";
        options.desc = "move buffer fowards";
    }

    {
        mode = "t";
        key = "<C-l>";
        action = "<C-\\><C-n>:BufferLineMoveNext<CR>";
        options.desc = "move buffer fowards";
    }

    {
        mode = "n";
        key = "<C-h>";
        action = ":BufferLineMovePrev<CR>";
        options.desc = "move buffer backwards";
    }

    {
        mode = "t";
        key = "<C-h>";
        action = "<C-\\><C-n>:BufferLineMovePrev<CR>";
        options.desc = "move buffer backwards";
    }

    # page up & down centering screen

    {
        mode = "n";
        key = "<C-u>";
        action = "<C-u>zz";
        options.desc = "page up";
    }

    {
        mode = "n";
        key = "<C-d>";
        action = "<C-d>zz";
        options.desc = "page down";
    }

  ];

  extraConfigLua = ''
    -- numbers on the sidelines
    vim.opt.number = true
    vim.opt.relativenumber = true

    -- how many spaces does the tab add
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.expandtab = true

    -- make the cursor always be a block
    vim.opt.guicursor = "a:block"
  '';

}
