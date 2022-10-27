# nix-config
My Nix Configuration

## Usage with home-manager

**install nix and home-manager**

```bash
curl -L https://nixos.org/nix/install | sh # install nix
nix-channel --add # add nix channels
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH} # add nix channels to path
nix-channel --update # update nix channels
nix-env -iA nixpkgs.home-manager # install home-manager
```

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
