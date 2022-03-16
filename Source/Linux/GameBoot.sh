#!/bin/bash

Instance="Beta 1.7.3 - Nostalgia Patch"

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
mkdir -p "$GameData/instances/$Instance"

# Load files from GameData to runtime folder
cp \
	"$GameData/"*.cfg \
	"$GameData/"*.json \
	"$GameData/"*.log \
	"./MultiMC/"
cp -r \
	"$GameData/instances/$Instance" \
	"./MultiMC/instances/"

# Run the game
"./MultiMC/MultiMC" -l "$Instance"

# Save files from runtime to GameData folder
cp \
	"./MultiMC/"* \
	"$GameData/"
cp -r \
	"./MultiMC/instances/$Instance" \
	"$GameData/instances/"
