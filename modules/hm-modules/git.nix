{pkgs, ...}: {
  home.packages = with pkgs; [
    gh
  ];
  programs.git = {
    enable = true;
    userName = "jameschubbuck";
    userEmail = "jameschubbuck@hunschool.org";
  };
  #programs.gh.enable = true;
}
