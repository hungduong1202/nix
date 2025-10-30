{ config, pkgs, lib, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    extraPackages = with pkgs; [
      lua-language-server
      stylua
      tree-sitter
      lazygit
      gdu
    ];
  };

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/nix-config/home/dotfiles/nvim/lazynvim";

  # xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink
  #   "${config.home.homeDirectory}/nix-config/home/dotfiles/nvim/nvchad";

  # home.file.".config/nvim/init.lua".source = config.lib.file.mkOutOfStoreSymlink
  #   "${config.home.homeDirectory}/nix-config/home/dotfiles/lazynvim/init.lua";
}
