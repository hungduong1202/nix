{ config, pkgs, lib, ... }:

let
  script = lib.concatStringsSep "\n" [
    ''if [ ! -d "$HOME/.dotfiles/nvim" ]; then''
    ''echo "Bootstrapping Neovim config..."''
    ''mkdir -p "$HOME/.dotfiles"''
    ''
      
            "${pkgs.git}/bin/git" clone https://github.com/hungduong1202/lazynvim "$HOME/.dotfiles/nvim"''
    "fi"
  ];
in {
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

  # Symlink ~/.dotfiles/nvim -> ~/.config/nvim
  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/.dotfiles/nvim";

  # Bootstrap script: chạy khi build Home Manager
  home.activation.nvimBootstrap =
    lib.hm.dag.entryAfter [ "writeBoundary" ] "${script}";
}
