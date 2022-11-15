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

  # kitty config
  home.file.".config/kitty/".source = ./dotfiles/kitty;
  
  # Rclone config
  home.file.".config/rclone/".source = ./dotfiles/rclone;

  # Hypr config
  home.file.".config/hypr/".source = ./dotfiles/hypr;

  # Waybar config
  home.file.".config/waybar/".source = ./dotfiles/waybar;

  # Git config
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
