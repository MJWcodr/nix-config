{ config, pkgs, ... }:
{
    # raw config files
    home.file.".config/i3/".source = ./i3;
}
