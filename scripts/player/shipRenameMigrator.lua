local craftTouched = 0
local touched = false

function initialize()
    if onServer() then
        print("RenameShips Migrator registered!")
    end
end
    
function addRenameScriptToEntities(entities)
    for i, anyCraft in pairs(entities) do
        local shipRenameInstalled = anyCraft:getValue("shipRenameScriptEnabled")
        if not shipRenameInstalled then
            print("RenameShips Migrator: Adding ShipRename to "..tostring(anyCraft.translatedTitle).." "..tostring(anyCraft.name)..".")
            anyCraft:addScriptOnce("mods/RenameShips/scripts/entity/shipRename.lua")
            anyCraft:setValue("shipRenameScriptEnabled", true)
            craftTouched = craftTouched + 1

            if not touched then
                touched = true
            end
        end        
    end
end

function onSectorChanged()
    if onServer() then
        local stations = {Sector():getEntitiesByType(EntityType.Station)}
        local ships = {Sector():getEntitiesByType(EntityType.Ship)}
        
        playerShip = Entity()
        player = Player()
        
        if playerShip.factionIndex == player.index then
            addRenameScriptToEntities(stations)
            addRenameScriptToEntities(ships)
            
            if touched then
                print("***================================***")
                if craftTouched == 1 then
                    print("RenameShips Migrator: Added ShipRename to 1 craft in this Sector.\n")
                else
                    print("RenameShips Migrator: Added ShipRename to "..tostring(craftTouched).." craft in this Sector.\n")
                    craftTouched = 0
                end
            end
        end
    end
end
