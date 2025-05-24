{
  description = "My nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    # You can access packages and modules from different nixpkgs revs
    # at the same time. Here's an working example:
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    # Also see the 'stable-packages' overlay at 'overlays/default.nix'.

    # NixOS
    linux.url = "github:nixos/nixpkgs/nixos-unstable";

    # Nix darwin
    darwin.url = "github:LnL7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    # Home manager
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Apple fonts
    apple-fonts.url = "github:Lyndeno/apple-fonts.nix";
  };

  outputs =
    {
      self,
      nixpkgs,
      linux,
      darwin,
      home-manager,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      # Supported systems for your flake packages, shell, etc.
      systems = [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      # This is a function that generates an attribute by calling a function you
      # pass to it, with each system as an argument
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      # Your custom packages
      # Accessible through 'nix build', 'nix shell', etc
      packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
      # Formatter for your nix files, available through 'nix fmt'
      # Other options beside 'alejandra' include 'nixpkgs-fmt'
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-rfc-style);

      # Your custom packages and modifications, exported as overlays
      overlays = import ./overlays { inherit inputs; };
      # Reusable nixos modules you might want to export
      # These are usually stuff you would upstream into nixpkgs
      nixosModules = import ./modules/nixos;
      # Reusable nix-darwin modules you might want to export
      # These are usually stuff you would upstream into nix-darwin
      nixDarwinModules = import ./modules/nix-darwin;
      # Reusable home-manager modules you might want to export
      # These are usually stuff you would upstream into home-manager
      homeManagerModules = import ./modules/home-manager;

      # NixOS configuration entrypoint
      nixosConfigurations = {
        # Available through "nixos-rebuild --flake '.#utkarsh-nix' switch"
        utkarsh-nix = linux.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
          };
          modules = [
            # > Our main nixos configuration file <
            ./hosts/nixos/configuration.nix
          ];
        };

        # Available through "nixos-rebuild --flake '.#utkarsh-dev' switch"
        utkarsh-dev = linux.lib.nixosSystem {
          specialArgs = {
            inherit inputs outputs;
          };
          modules = [
            # > Our main nixos configuration file <
            ./hosts/ec2/configuration.nix
          ];
        };
      };

      # Darwin configuration entrypoint
      darwinConfigurations = {
        # Available through "darwin-rebuild --flake '.#utkarsh-mbp' switch"
        utkarsh-mbp = darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          specialArgs = {
            inherit inputs outputs;
          };
          modules = [
            # > Our main nix-darwin configuration file <
            ./hosts/nix-darwin/configuration.nix
          ];
        };
      };

      # Standalone home-manager configuration entrypoint
      homeConfigurations = {
        # Available through "home-manager --flake '.#utkarsh@utkarsh-nix' switch"
        "utkarsh@utkarsh-nix" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = {
            inherit inputs outputs;
          };
          modules = [
            # > Our main home-manager configuration file <
            ./home/nixos/home.nix
          ];
        };

        # Available through "home-manager --flake '.#utkarsh@utkarsh-dev' switch"
        "utkarsh@utkarsh-dev" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.aarch64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = {
            inherit inputs outputs;
          };
          modules = [
            # > Our main home-manager configuration file <
            ./home/ec2/home.nix
          ];
        };

        # Available through "home-manager --flake '.#utkarsh@utkarsh-mbp' switch"
        "utkarsh@utkarsh-mbp" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.aarch64-darwin; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = {
            inherit inputs outputs;
          };
          modules = [
            # > Our main home-manager configuration file <
            ./home/nix-darwin/home.nix
          ];
        };
      };
    };
}
