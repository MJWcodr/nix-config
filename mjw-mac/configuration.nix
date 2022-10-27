{ config, pkgs, ... }:

{

  imports = [ <home-manager/nix-darwin> ];
  environment.systemPackages =
    [ 
	pkgs.vim
    ];

  # Use a custom configuration.nix location.
  # darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina
  # programs.fish.enable = true;

  system.stateVersion = 4;
  
  home-manager.useUserPackages = true; # enable home-manager

  home-manager.users.matthias = { pkgs, ... }: {
  	home.packages = [
	 pkgs.atool 
	 pkgs.httpie 
	];
  	programs.bash.enable = true;
	programs.zsh.enable = true
  # };

  

}
