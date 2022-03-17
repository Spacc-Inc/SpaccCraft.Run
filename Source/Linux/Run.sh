#!/bin/sh

Arch=$(uname -m)
JavaPath=JRE/$Arch
export LD_LIBRARY_PATH=$JavaPath/lib/$Arch/:$LD_LIBRARY_PATH
Java=$JavaPath/bin/java
$Java -jar Launcher.jar
