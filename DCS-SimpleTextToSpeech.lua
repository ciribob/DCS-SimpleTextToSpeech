--[[

DCS-SimpleTextToSpeech
Version 0.2
Compatible with SRS version 1.9.0.2 +

DCS Modification Required:

You will need to edit MissionScripting.lua in DCS World/Scripts/MissionScripting.lua and remove the sanitisation.
To do this remove all the code below the comment - the line starts "local function sanitizeModule(name)"

Do this without DCS running to allow mission scripts to use os functions.

*You WILL HAVE TO REAPPLY AFTER EVERY DCS UPDATE*

USAGE:

Add this script into the mission as a DO SCRIPT or DO SCRIPT FROM FILE to initialise it

Make sure to edit the STTS.SRS_PORT and STTS.DIRECTORY to the correct values before adding to the mission.

Then its as simple as calling the correct function in LUA as a DO SCRIPT or in your own scripts

Example calls:

STTS.TextToSpeech("Hello DCS WORLD","251","AM","1.0","SRS",2)

Arguments in order are:
 - Message to say, make sure not to use a newline (\n) !
 - Frequency in MHz
 - Modulation - AM/FM
 - Volume - 1.0 max, 0.5 half
 - Name of the transmitter - ATC, RockFM etc
 - Coalition - 0 spectator, 1 red 2 blue

 This example will say the words "Hello DCS WORLD" on 251 MHz AM at maximum volume with a client called SRS and to the Blue coalition only


STTS.PlayMP3("C:\\Users\\Ciaran\\Downloads\\PR-Music.mp3","255,31","AM,FM","0.5","Multiple",0)

Arguments in order are:
 - FULL path to the MP3 to play
 - Frequency in MHz - to use multiple separate with a comma - Number of frequencies MUST match number of Modulations
 - Modulation - AM/FM - to use multiple
 - Volume - 1.0 max, 0.5 half
 - Name of the transmitter - ATC, RockFM etc
 - Coalition - 0 spectator, 1 red 2 blue

This will play that MP3 on 255MHz AM & 31 FM at half volume with a client called "Multiple" and to Spectators only


]]


STTS = {}
-- FULL Path to the FOLDER containing DCS-SR-ExternalAudio.exe - EDIT TO CORRECT FOLDER
STTS.DIRECTORY = "C:\\Users\\Ciaran\\Dropbox\\Dev\\DCS\\DCS-SRS\\install-build"
STTS.SRS_PORT = 5002 -- LOCAL SRS PORT - DEFAULT IS 5002


-- DONT CHANGE THIS UNLESS YOU KNOW WHAT YOU'RE DOING
STTS.EXECUTABLE = "DCS-SR-ExternalAudio.exe"

function STTS.TextToSpeech(message,freqs,modulations, volume,name, coalition )

    message = message:gsub("\"","\\\"")

    local cmd = string.format("start /B /min \"%s\" \"%s\\%s\" \"%s\" %s %s %s %s \"%s\" %s", STTS.DIRECTORY, STTS.DIRECTORY, STTS.EXECUTABLE, message, freqs, modulations, coalition,STTS.SRS_PORT, name, volume )
    env.info("[DCS-STTS] TextToSpeech Command :\n" .. cmd.."\n")
    os.execute(cmd)

end

function STTS.PlayMP3(pathToMP3,freqs,modulations, volume,name, coalition )

    local cmd = string.format("start /B /min \"%s\" \"%s\\%s\" \"%s\" %s %s %s %s \"%s\" %s", STTS.DIRECTORY, STTS.DIRECTORY, STTS.EXECUTABLE, pathToMP3, freqs, modulations, coalition,STTS.SRS_PORT, name, volume )
    env.info("[DCS-STTS] MP3 Command :\n" .. cmd.."\n")
    os.execute(cmd)

end
