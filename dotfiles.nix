{ config, pkgs, ... }:
{
  imports = [

    # Fish config
    ./dotfiles/fish.nix

    # i3 config
    ./dotfiles/windowManager.nix
  ];

  # Nvim config
  home.file.".config/nvim/".source = ./dotfiles/nvim;

  # Tmux config
  home.file.".tmux.conf".source = ./dotfiles/tmux.conf;

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
