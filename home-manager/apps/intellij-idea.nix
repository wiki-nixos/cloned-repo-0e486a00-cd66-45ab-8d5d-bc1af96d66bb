{ pkgs, stdenv, autoPatchelfHook, gcc, musl, lldb }:

stdenv.mkDerivation rec {
  pname = "intellij";
  version = "1.0.0";

  #TODO download and verify hash src = "https://download.jetbrains.com/idea/ideaIU-2023.2.1.tar.gz"

  src = /home/user/Downloads/ideaIU-2023.2.1.tar.gz;
  #src = "/home/user/Downloads/ideaIU-2023.2.1/idea-IU-232.9559.62/";
  
  #nativeBuildInputs = [
  #  autoPatchelfHook
  #];
  buildInputs = [ gcc musl lldb pkgs.util-linux pkgs.libselinux pkgs.pam pkgs.audit ];


  sourceRoot = ".";
  unpackCmd = "tar -xzf $src .";

  installPhase = ''
    mkdir -p $out/{bin,intellij-idea-lib}
    cp -r ./idea-IU-232.9559.62/ $out/intellij-idea-lib/
    ln -s  $out/intellij-idea-lib/idea-IU-232.9559.62/bin/idea.sh $out/bin/intellij-idea

    echo -e '#!/bin/sh\necho "hello intellij"' > $out/bin/intellij
    chmod +x $out/bin/intellij
  '';
}
