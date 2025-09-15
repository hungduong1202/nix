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

  # home.file.".config/nvim/init.lua".source = "./dotfiles/nvim/init.lua";
  #

  # xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink
  #   "${config.home.homeDirectory}/nix-config/home/dotfiles/nvim";

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/nix-config/home/dotfiles/nvchad";

  # home.file.".config/nvim/init.lua".source = config.lib.file.mkOutOfStoreSymlink
  #   "${config.home.homeDirectory}/nix-config/home/dotfiles/nvim/init.lua";
}
