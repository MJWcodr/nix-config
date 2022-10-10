{ config, pkgs, ... }:
{
    # raw config files
    home.file.".config/nvim/".source = ./nvim;
}