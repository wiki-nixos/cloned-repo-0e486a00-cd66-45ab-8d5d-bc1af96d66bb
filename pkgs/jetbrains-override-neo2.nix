{ fetchurl, jetbrains }:

let
  neo2AwtHackJar = fetchurl {
    url = "https://github.com/chenkelmann/neo2-awt-hack/blob/master/releases/neo2-awt-hack-0.5-java8oracle.jar?raw=true";
    sha256 = "sha256-/2OGd2Nl7tRqkB73LJjLXMlRwFHwOdX9cnXRk5BP3S8=";
    name = "neo2-awt-hack-0.5.jar";
  };

  overrideFn = pname: xname: oldAttrs: {
    postInstall = oldAttrs.postInstall or "" + ''
      cp ${neo2AwtHackJar} $out/${pname}/neo2-awt-hack-0.5.jar

      # 1. Extrahieren Sie die letzten zwei Zeilen in eine temporäre Datei.
      tail -n 2 $out/${pname}/bin/.${xname}.sh-wrapped > temp_last_lines.txt

      # 2. Löschen Sie die letzten zwei Zeilen aus der ursprünglichen Datei.
      sed -i 'N;$!P;$!D;$d' $out/${pname}/bin/.${xname}.sh-wrapped

      # 3. Fügen Sie den gewünschten String zur ursprünglichen Datei hinzu.
      # echo "--patch-module=java.desktop=../neo2-awt-hack-0.5.jar \\" >> $out/${pname}/bin/.${xname}.sh-wrapped
      echo "--patch-module=java.desktop=$out/${pname}/neo2-awt-hack-0.5.jar \\" >> $out/${pname}/bin/.${xname}.sh-wrapped

      # 4. Fügen Sie die ursprünglichen letzten zwei Zeilen wieder an die ursprüngliche Datei an.
      cat temp_last_lines.txt >> $out/${pname}/bin/.${xname}.sh-wrapped

      # Aufräumen
      rm temp_last_lines.txt
    '';
  };
in

{
  idea-ultimate = jetbrains.idea-ultimate.overrideAttrs (overrideFn "idea-ultimate" "idea");
  clion = jetbrains.clion.overrideAttrs (overrideFn "clion" "clion");
}
