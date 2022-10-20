{ config, pkgs, ... }:
{
    # raw config files
    home.file.".config/kitty/".source = ./kitty;
}
