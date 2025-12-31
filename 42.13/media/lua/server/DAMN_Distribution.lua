DAMN = DAMN or {};
DAMN.Distribution = DAMN.Distribution or {};

function DAMN.Distribution:addItemsToLocations(itemsAndChances, locations)
    if ProceduralDistributions and ProceduralDistributions["list"]
    then
        for item, chance in pairs(itemsAndChances)
        do
            for i, location in ipairs(locations)
            do
                if ProceduralDistributions["list"][location] and ProceduralDistributions["list"][location]["items"]
                then
                    table.insert(ProceduralDistributions["list"][location]["items"], item);
                    table.insert(ProceduralDistributions["list"][location]["items"], chance);
                else
                    DAMN:log("Skipping item distro location [" .. tostring(location) .. "] because it is invalid");
                end
            end
        end
    end
end

function DAMN.Distribution:addVehicleToZones(fullVehicleId, zonesAndChances)
    if VehicleZoneDistribution
    then
        for zone, chance in pairs(zonesAndChances)
        do
            if VehicleZoneDistribution[zone] and VehicleZoneDistribution[zone]["vehicles"]
            then
                VehicleZoneDistribution[zone]["vehicles"][fullVehicleId] = {
                    index = -1,
                    spawnChance = chance,
                };
            else
                DAMN:log("Skipping vehicle distro zone [" .. tostring(zone) .. "] because it is invalid");
            end
        end
    end
end