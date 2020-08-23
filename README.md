# DCS-SimpleTextToSpeech
LUA Script adding Text to Speech (and MP3 playback) using SRS in DCS

Compatible with SRS version 1.9.0.2 +

## Video:

https://clips.twitch.tv/embed?clip=ZanyApatheticNostrilCharlieBitMe

## Prerequisites:

### DCS Modification
You will need to edit MissionScripting.lua in DCS World/Scripts/MissionScripting.lua and remove the sanitisation.
To do this remove all the code below the comment - the line starts "local function sanitizeModule(name)"

Do this without DCS running to allow mission scripts to use os functions.

**You WILL HAVE TO REAPPLY AFTER EVERY DCS UPDATE**

### SRS Server
SRS Server installed and running on the same machine as 

## Usage:

Add the DCS-SimpleTextToSpeech.lua script into the mission as a "DO SCRIPT" or "DO SCRIPT FROM FILE" to initialise it

Make sure to edit the STTS.SRS_PORT and STTS.DIRECTORY to the correct values before adding to the mission.

The DCS-SR-ExternalAudio.exe can be found on the SRS Github releases here: https://github.com/ciribob/DCS-SimpleRadioStandalone/releases/latest and will be in the same folder as where you installed SRS too on your server

Then its as simple as calling the correct function in LUA as a "DO SCRIPT" or in your own scripts

As this is fully accessible in LUA, you can build all sorts or interesting things into your missions on the server. Hidden radio channels, player call outs over SRS or even an alternative AWACS / GCI system

Example calls:

```STTS.TextToSpeech("Hello DCS WORLD","251","AM","1.0","SRS",2)```

Arguments in order are:
 - Message to say, make sure not to use a newline (\n) !
 - Frequency in MHz
 - Modulation - AM/FM
 - Volume - 1.0 max, 0.5 half
 - Name of the transmitter - ATC, RockFM etc
 - Coalition - 0 spectator, 1 red 2 blue

 This example will say the words "Hello DCS WORLD" on 251 MHz AM at maximum volume with a client called SRS and to the Blue coalition only


```STTS.PlayMP3("C:\\Users\\Ciaran\\Downloads\\PR-Music.mp3","255,31","AM,FM","0.5","Multiple",0)```

Arguments in order are:
 - FULL path to the MP3 to play
 - Frequency in MHz - to use multiple separate with a comma - Number of frequencies MUST match number of Modulations
 - Modulation - AM/FM - to use multiple
 - Volume - 1.0 max, 0.5 half
 - Name of the transmitter - ATC, RockFM etc
 - Coalition - 0 spectator, 1 red 2 blue

This will play that MP3 on 255MHz AM & 31 FM at half volume with a client called "Multiple" and to Spectators only

