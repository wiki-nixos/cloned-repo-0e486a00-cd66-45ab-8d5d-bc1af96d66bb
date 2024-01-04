{ lib, stdenv, writeShellScriptBin, makeDesktopItem, copyDesktopItems, xhost, docker, jetbrains }:

let
  script = writeShellScriptBin "jetbrains-client" ''
    ${lib.getExe docker} build ${./.} -t jetbrains-client
    mkdir -p ~/.jetbrains-client

    ${lib.getExe xhost} +local:docker
    ${lib.getExe docker} run --rm \
      -v $HOME/.Xauthority:/root/.Xauthority:rw \
      -v ~/.jetbrains-client:/home/user \
      -e DISPLAY \
      --network host \
      jetbrains-client
  '';
in

stdenv.mkDerivation rec {
  pname = "jetbrains-client";
  version = "2023.3.2";

  src = jetbrains.idea-ultimate;

  preInstall = ''
    mkdir -p $out/share/pixmaps/
    cp -r ${script}/bin/ $out/
    cp $src/idea-ultimate/bin/idea.svg $out/share/pixmaps/
  '';

  nativeBuildInputs = [ copyDesktopItems ];

  desktopItems = [
    (makeDesktopItem {
      name = pname;
      exec = pname;
      icon = "idea";
      desktopName = "JetBrains Client ${version}";
    })
  ];
}
