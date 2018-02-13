===Rename Ships 1.1.3===
***Usage***
This mod adds a Holy Grail icon to the UI. Use this icon to modify the name of the ship you are currently piloting.
To modify the name of another ship you own, which you are currently not piloting, bring up the Interaction Window with F and choose "Rename Ship".
This can also be done on the ship you're currently piloting yourself, of course.
Either way, a dialog comes up within which you can type your new ship's name. The name is limited to 35 characters, as all ship names in Avorion are. Press OK and the new name is applied. Press the X button to close the dialog afterwards.
See the following video for an explanation:
https://youtu.be/HxgALXLufYY


***Prerequisites***
This mod requires an external resource: http://www.avorion.net/forum/index.php/topic,3918.0.html]ShipScriptLoader
Please follow the installation instructions of ShipScriptLoader before you install Rename Ships.


***Installation Instructions***
- Download the mod ShipScriptLoader (http://www.avorion.net/forum/index.php/topic,3918.0.html) by Dirtyredz and follow its installation instructions. This is required to load Rename Ships. If you are already using it you may skip this step.
!!Note!!
There is an issue in the installation instructions of ShipScriptLoader. These are the lines you should add to Avorion/data/scripts/server/server.lua:

local s, b = pcall(require, 'Avorion/mods/ShipScriptLoader/scripts/server/server')
    if s then if b.onPlayerLogIn then local a = onPlayerLogIn; onPlayerLogIn = function(c) a(c); b.onPlayerLogIn(c); end end end

- Open the file Avorion/mods/ShipScriptLoader/config/ShipScriptLoader.lua
- Before the last line containing "return Config" add this:

Config.Add("mods/RenameShips/scripts/entity/shipRename.lua")
Config.Add("mods/RenameShips/scripts/player/shipRenameMigrator.lua")

- Copy the directory mods contained in the RenameShips .zip file directly into the Steam installation directory folder for Avorion.


***Changelog***
1.1.3 - Bugfix: shipRenameMigrator now prints the correct amount of ships into Console when entering a new Sector.
NOTE: A new file, mods/RenameShips/scripts/player/shipRenameMigrator.lua was added in this version, which needs to be added to the config of ShipScriptLoader.lua. See the updated installation instructions in this forum post or README file included in the download.

1.1.2 - Bugfix: You can now rename ships you own or have Alliance permissions for from long range! Just interact with any craft you own or have permissions for as usual, and choose Rename Ship.
1.1.1 - Bugfix: The Rename dialog now closes when you press OK. 
1.1 - Added Alliance recognition: players in Alliance craft will now have the ability to rename those craft if they have the appropriate Alliance permissions to fly ships. Added a README.txt to the modpack for bundled installation instructions (this file!).
1.0 - Initial Release


***Credits***
- Dirtyredz for the ShipScriptLoader.
- Laserzwei's post for CarrierCommander (http://www.avorion.net/forum/index.php/topic,4268.0.html), whose structure (and, partly, words) I shamelessly copy-pasta'd because it is very effective at getting the point across succinctly.
