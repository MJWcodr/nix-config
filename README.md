# nix-config
My Nix Configuration using Home Manager

## Installation of Home Manager

### Non NixOs

```bash

# First install the nix package Manager
curl -L https://nixos.org/nix/install | sh # Install Home Manager

# Add Home Manager to Nix Channels
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz # add home manager nix channel
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH} # export NIX_PATH

# Install Home manager
nix-channel --update # update nix channels
nix-env -iA nixpkgs.home-manager # install home-manager
```

### NixOS



### Nix Darwin

**clone this repo**

```bash
git clone git@github.com:MJWcodr/nix-config.git ~/.config/nixpkgs

```

**link proper home.nix**

```
ln mjw-desktop/home.nix home.nix
```

**link home-manager**

```bash
home-manager switch
# you can also use the following command to link home-manager
hms
```
