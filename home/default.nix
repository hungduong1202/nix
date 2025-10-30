{ config, pkgs, ... }:

let
  username = "hung.duong";
  homeDir =
    if pkgs.stdenv.isDarwin then "/Users/${username}"
    else "/home/${username}";
in
{
  home.username = username;
  home.homeDirectory = homeDir;
  home.stateVersion = "25.05";

  home.sessionVariables = {
    CARGO_TARGET_DIR = "${config.home.homeDirectory}/.cargo/target";
  };

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
    pay-respects
    fnm
    gnumake
    gcc
    zip
    rustc
    cargo
    unzip
    lazygit
    statix
    nixpkgs-fmt
    nil
  ];

  programs.git = {
    enable = true;

    settings = {
      user.name = "hung.duong";
      user.email = "hung12384@gmail.com";
    };
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  imports = [
    ./zsh.nix
    ./nvim.nix
  ];
}
