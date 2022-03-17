#!/bin/bash

# Check and prepare persistent GameData folder
if [[ -n $XDG_CONFIG_HOME ]]
then
	GameData="$XDG_CONFIG_HOME"
else
	if [[ -n $HOME ]]
	then
		GameData="$HOME"
	else
		GameData="/home/$(whoami)"
	fi
	GameData="$GameData/.config"
fi
GameData="$GameData/SpaccCraft.Run"
mkdir -p "$GameData/Data"

# Load files from GameData to runtime folder
cp -r \
	"$GameData/Data" \
	"."

# Run the game
Arch=$(uname -m)
JavaPath=JRE/$Arch
export LD_LIBRARY_PATH=$JavaPath/lib/$Arch/:$LD_LIBRARY_PATH
Java=$JavaPath/bin/java
exec $Java -Xmx512M -XX:+UseConcMarkSweepGC -XX:+CMSIncrementalMode -XX:-UseAdaptiveSizePolicy -Xmn128M -Djava.library.path=.minecraft/versions/b1.7.3/b1.7.3-natives -cp .minecraft/libraries/net/minecraft/launchwrapper/1.5/launchwrapper-1.5.jar:.minecraft/libraries/net/sf/jopt-simple/jopt-simple/4.5/jopt-simple-4.5.jar:.minecraft/libraries/org/ow2/asm/asm-all/4.1/asm-all-4.1.jar:.minecraft/libraries/net/java/jinput/jinput/2.0.5/jinput-2.0.5.jar:.minecraft/libraries/net/java/jutils/jutils/1.0.0/jutils-1.0.0.jar:.minecraft/libraries/org/lwjgl/lwjgl/lwjgl/2.9.0/lwjgl-2.9.0.jar:.minecraft/libraries/org/lwjgl/lwjgl/lwjgl_util/2.9.0/lwjgl_util-2.9.0.jar:.minecraft/versions/b1.7.3/b1.7.3.jar net.minecraft.launchwrapper.Launch $(cat Username.txt) - --gameDir .minecraft --assetsDir .minecraft/assets/virtual/pre-1.6

# Save files from runtime to GameData folder
cp -r \
	"." \
	"$GameData"
