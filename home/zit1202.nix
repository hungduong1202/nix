{ config, pkgs, ... }:

{
  home.username = "zit1202";
  home.homeDirectory = "/home/zit1202";
  home.stateVersion = "25.05";
  home.shell.enableZshIntegration = true;
  home.packages = with pkgs; [
    htop
    git
    fd
    ripgrep
    curl
    python3
    meslo-lgs-nf
    zsh
    flutter
    nix-ld
    pay-respects
    fnm
    gnumake
    gcc
    zip
    rustc
    cargo
    unzip
    lazygit
  ];

  programs.git = {
    enable = true;
    userName = "hung.duong";
    userEmail = "hung12384@gmail.com";
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  imports = [ ./zsh.nix ./nvim.nix ];

}
