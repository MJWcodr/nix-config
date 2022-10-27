{ config, pkgs, ... }:
{
    # raw config files for i3
    home.file.".config/i3/".source = ./i3;

    # raw config files for polybar
    home.file.".config/polybar/".source = ./polybar;
}
