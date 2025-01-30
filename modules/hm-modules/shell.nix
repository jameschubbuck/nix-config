{pkgs, ...}: {
  home.packages = with pkgs; [
    lsd
    neovim
    zoxide
  ];
  programs = {
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
    ghostty = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        command = "zsh";
      };
    };
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      ls = "lsd";
      nixup = "/config/assets/scripts/nix-up.sh";
      nixgc = "/config/assets/scripts/nix-gc.sh";
      cd = "z";
    };
  };
}
