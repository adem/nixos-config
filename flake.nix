{
  inputs = {
    apple-silicon-support = {
      url = "github:tpwrules/nixos-apple-silicon";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    restream = {
      url = "github:rien/reStream";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    voxtype = {
      url = "github:peteonrails/voxtype";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      apple-silicon-support,
      home-manager,
      nixpkgs,
      nur,
      plasma-manager,
      restream,
      voxtype,
      ...
    }:
    {
      nixosConfigurations = {
        "nixos-tower" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = {
            restream-pkg = restream.packages.x86_64-linux.default;
            voxtype-pkg = voxtype.packages.x86_64-linux.vulkan;
          };
          modules = [
            home-manager.nixosModules.home-manager
            nur.modules.nixos.default
            {
              home-manager.sharedModules = [
                plasma-manager.homeModules.plasma-manager
              ];
            }
            ./hosts/desktop
          ];
        };
        "nixos-mbp" = nixpkgs.lib.nixosSystem {
          system = "aarch64-linux";
          specialArgs = {
            restream-pkg = restream.packages.aarch64-linux.default;
            voxtype-pkg = voxtype.packages.aarch64-linux.default;
          };
          modules = [
            apple-silicon-support.nixosModules.apple-silicon-support
            home-manager.nixosModules.home-manager
            nur.modules.nixos.default
            ./hosts/mbp
          ];
        };
      };
    };
}
