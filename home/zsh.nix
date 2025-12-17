{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    history.size = 10000;

    shellAliases = {
      n = "nvim";
      ws = "cd ~/workspace";
      c = "clear";
      ll = "ls -l";
      la = "ls -la";
      gs = "git status";
      update = "nix run github:nix-community/home-manager/master -- switch --flake ~/nix-config#hung.duong";
    };

    initContent = builtins.replaceStrings [ "\r\n" ] [ "\n" ] ''
      export PATH="/nix/var/nix/profiles/default/bin:$PATH"
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
      eval "$(fnm env)"
      eval "$(pay-respects zsh --alias)"
      export PUB_CACHE="$HOME/.pub-cache"
      export FLUTTER_ROOT="$HOME/.flutter-sdk"
      export PATH="$FLUTTER_ROOT/bin:$PATH"
      export TMPDIR="/tmp"
      export FLUTTER_SUPPRESS_ANALYTICS=true
      source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
      source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    '';

    # initContent ="source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    # initExtra = "[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh && eval '$(fnm env)'";

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "docker"
        "kubectl"
        # "zsh-autosuggestions"
        # "zsh-syntax-highlighting"
        # pkgs.zsh-autosuggestions.pname
        # pkgs.zsh-syntax-highlighting.pname
        # pkgs.zsh-completions.pname
        # pkgs.zsh-history-substring-search.pname
      ];
    };

  };

  home.file.".p10k.zsh".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/nix-config/home/dotfiles/.p10k.zsh";

  home.packages = with pkgs; [ zsh-autosuggestions zsh-syntax-highlighting ];
}
