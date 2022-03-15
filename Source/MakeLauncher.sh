#!/bin/sh

g++ \
	Launcher.cpp \
	-o Launcher.elf \
	-lfltk -lXext -lX11 -lm
