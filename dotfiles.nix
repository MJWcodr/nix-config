{ config, pkgs, ... }:
{
  imports = [
    ./dotfiles/nvim.nix
    ./dotfiles/fish.nix
  ];
  


  programs.git = {
    enable = true;
    userName = "Matthias Wünsch";
    userEmail = "matthias.wuensch175@gmail.com";
    extraConfig = {
      core = {
        editor = "nvim";
      };
      color = {
        ui = "true";
      };
    };
  };

}
