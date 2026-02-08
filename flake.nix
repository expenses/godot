{
  description = "Flake utils demo";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShells.default = with pkgs;
          mkShell {
          	inherit (godot) nativeBuildInputs buildInputs;

            LD_LIBRARY_PATH = lib.makeLibraryPath [
              fontconfig
              wayland
              libxkbcommon
              libGL

              xorg.libX11
              xorg.libXcursor
              xorg.libXi
              xorg.libXrandr
              xorg.libXext
              xorg.libXinerama
              libdecor
              dbus
              vulkan-loader
              vulkan-headers
            ];
          };
      }
    );
}
