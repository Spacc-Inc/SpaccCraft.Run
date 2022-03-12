#!/bin/bash

Arch="amd64"
Name="SpaccCraft.Run"
Label="$Name | One-click SpaccCraft Launcher [Linux $Arch]"

Compression="--nocomp" # --bzip2

makeself "$Compression" "." "./SpaccCraft.Run.$Arch" "$Label" "./Run.bash"
