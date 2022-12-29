{ config, pkgs, ... }:

{

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "matthias";
  home.homeDirectory = "/home/matthias";

  # imports
  imports = [ 
    ./common/dotfiles.nix
<<<<<<< HEAD
    ./mjw-desktop/packages.nix
   #  ./mjw-desktop/services.nix
=======
    ./mjw0/packages.nix
>>>>>>> 2993bd5e88042e70d31594e4798e32c708c14ff7
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # allow unfree packages
  nixpkgs.config.allowUnfree = true;

  targets.genericLinux.enable = if pkgs.system == "x86_64-linux" then
  true else false; # enable the genericLinux target if we're on x86_64-linux

  # enable services
}
