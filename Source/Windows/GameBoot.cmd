@ECHO OFF

REM SET APPDATA=%CD%

REM : Fix for file not read correctly if not terminated
TYPE Username.txt > WinUsrnm.txt
ECHO. >> WinUsrnm.txt

REM : Reading Minecraft Username
SET /P Username=<WinUsrnm.txt

REM : Starting the game
REM jre1.6.0_07\bin\java.exe -jar Shiginima.jar
jre1.6.0_07\bin\javaw.exe -Xmx512M -XX:+UseConcMarkSweepGC -XX:+CMSIncrementalMode -XX:-UseAdaptiveSizePolicy -Xmn128M -Djava.library.path=.minecraft\versions\b1.7.3\b1.7.3-natives -cp .minecraft\libraries\net\minecraft\launchwrapper\1.5\launchwrapper-1.5.jar;.minecraft\libraries\net\sf\jopt-simple\jopt-simple\4.5\jopt-simple-4.5.jar;.minecraft\libraries\org\ow2\asm\asm-all\4.1\asm-all-4.1.jar;.minecraft\libraries\net\java\jinput\jinput\2.0.5\jinput-2.0.5.jar;.minecraft\libraries\net\java\jutils\jutils\1.0.0\jutils-1.0.0.jar;.minecraft\libraries\org\lwjgl\lwjgl\lwjgl\2.9.0\lwjgl-2.9.0.jar;.minecraft\libraries\org\lwjgl\lwjgl\lwjgl_util\2.9.0\lwjgl_util-2.9.0.jar;.minecraft\versions\b1.7.3\b1.7.3.jar net.minecraft.launchwrapper.Launch %Username% - --gameDir .minecraft --assetsDir .minecraft\assets\virtual\pre-1.6