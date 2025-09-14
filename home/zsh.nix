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
      update =
        "nix run home-manager -- switch --flake .#zit1202";
    };

    initContent = builtins.replaceStrings [ "\r\n" ] [ "\n" ] ''
      
              source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
              [[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
              eval "$(fnm env)"
              eval "$(pay-respects zsh --alias)"
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

  home.packages = with pkgs; [
    zsh-autosuggestions
    zsh-syntax-highlighting
  ];
}
