{ pkgs }:

let
  neo2AwtHackJar = pkgs.fetchurl {
    url = "https://github.com/chenkelmann/neo2-awt-hack/blob/master/releases/neo2-awt-hack-0.5-java8oracle.jar?raw=true";
    sha256 = "sha256-/2OGd2Nl7tRqkB73LJjLXMlRwFHwOdX9cnXRk5BP3S8=";
    name = "neo2-awt-hack-0.5.jar";
  };
in

pkgs.jetbrains.clion.overrideAttrs (oldAttrs: {
})

