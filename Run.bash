#!/bin/bash

Instance="Beta 1.7.3 - Nostalgia Patch"

# Check and prepare persistent AppData folder
if [[ -n $XDG_CONFIG_HOME ]]
then
	AppData="$XDG_CONFIG_HOME"
else
	if [[ -n $HOME ]]
	then
		AppData="$HOME"
	else
		AppData="/home/$(whoami)"
	fi
	AppData="$AppData/.config"
fi
AppData="$AppData/SpaccCraft.Run"
mkdir -p "$AppData/instances/$Instance"

# Restore files from AppData to runtime folder
cp \
	"$AppData/"*.cfg \
	"$AppData/"*.json \
	"$AppData/"*.log \
	"./MultiMC/"
cp -r \
	"$AppData/instances/$Instance" \
	"./MultiMC/instances/"

# Run the game
"./MultiMC/MultiMC" -l "$Instance"

# Update files from runtime to AppData folder
cp \
	"./MultiMC/"* \
	"$AppData/"
cp -r \
	"./MultiMC/instances/$Instance" \
	"$AppData/instances/"
