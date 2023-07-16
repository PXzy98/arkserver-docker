#!/bin/bash
steamcmd +force_install_dir /home/server +login anonymous +app_update 376030 +quit
 
./server/ShooterGame/Binaries/Linux/ShooterGameServer "$MAP?listen?AltSaveDirectoryName=$MAP?SessionName=$SERVERNAME?Port=7777?MaxPlayers=$MAXPLAYER?RCONPort=27020?QueryPort=27015" $OTHERPROMPTS