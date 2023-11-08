{ pkgs }:

let
  neo2AwtHackJar = pkgs.fetchurl {
    url = "https://github.com/chenkelmann/neo2-awt-hack/blob/master/releases/neo2-awt-hack-0.5-java8oracle.jar?raw=true";
    sha256 = "sha256-/2OGd2Nl7tRqkB73LJjLXMlRwFHwOdX9cnXRk5BP3S8=";
    name = "neo2-awt-hack-0.5.jar";
  };
in

pkgs.jetbrains.clion.overrideAttrs (oldAttrs: {

 postInstall = oldAttrs.postInstall or "" + ''
    cp ${neo2AwtHackJar} $out/clion/neo2-awt-hack-0.5.jar

    # 1. Extrahieren Sie die letzten zwei Zeilen in eine temporäre Datei.
    tail -n 2 $out/clion/bin/.clion.sh-wrapped > temp_last_lines.txt

    # 2. Löschen Sie die letzten zwei Zeilen aus der ursprünglichen Datei.
    sed -i 'N;$!P;$!D;$d' $out/clion/bin/.clion.sh-wrapped

    # 3. Fügen Sie den gewünschten String zur ursprünglichen Datei hinzu.
    # echo "--patch-module=java.desktop=../neo2-awt-hack-0.5.jar \\" >> $out/clion/bin/.clion.sh-wrapped
    echo "--patch-module=java.desktop=$out/clion/neo2-awt-hack-0.5.jar \\" >> $out/clion/bin/.clion.sh-wrapped

    # 4. Fügen Sie die ursprünglichen letzten zwei Zeilen wieder an die ursprüngliche Datei an.
    cat temp_last_lines.txt >> $out/clion/bin/.clion.sh-wrapped

    # Aufräumen
    rm temp_last_lines.txt
  '';
})

