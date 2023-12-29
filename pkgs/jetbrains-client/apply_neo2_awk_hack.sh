#!/bin/bash


IDEA_PATH="/app/idea-IU-233.13135.103"
EXECUTABLES=("jetbrains_client" "idea")


mkdir /home/user/.ideaNeo
wget -O /home/user/.ideaNeo/neo2-awt-hack-0.5.jar "https://github.com/chenkelmann/neo2-awt-hack/blob/master/releases/neo2-awt-hack-0.5-java8oracle.jar?raw=true"
echo "sha256-/2OGd2Nl7tRqkB73LJjLXMlRwFHwOdX9cnXRk5BP3S8=  neo2-awt-hack-0.5.jar" | sha256sum -c


for EXECUTABLE in "${EXECUTABLES[@]}"; do
    # copy last two lines in a temp file
    tail -n 2 "$IDEA_PATH/bin/$EXECUTABLE.sh" > temp_last_lines.txt

    # delete last two lines from the executable
    sed -i 'N;$!P;$!D;$d' "$IDEA_PATH/bin/$EXECUTABLE.sh"

    # Append the patch
    echo "--patch-module=java.desktop=/home/user/.ideaNeo/neo2-awt-hack-0.5.jar \\" >> "$IDEA_PATH/bin/$EXECUTABLE.sh"

    # append the last two lines again
    cat temp_last_lines.txt >> "$IDEA_PATH/bin/$EXECUTABLE.sh"

    # cleanup
    rm temp_last_lines.txt
done
