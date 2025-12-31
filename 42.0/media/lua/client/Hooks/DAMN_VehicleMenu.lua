require "Vehicles/ISUI/ISVehicleMenu";

local orgShowRadialMenu = ISVehicleMenu.showRadialMenu;

function ISVehicleMenu.showRadialMenu(playerObj)
    orgShowRadialMenu(playerObj);

    local vehicle = playerObj and playerObj:getVehicle();

    if vehicle
    then
        local menu = getPlayerRadialMenu(playerObj:getPlayerNum());
        local seat = vehicle:getSeat(playerObj);
        
        if menu and seat
        then
            seat = tostring(seat); -- easier to compare because the game fetches the index as string
        
            for i = 0, vehicle:getPartCount() -1
            do
                local part = vehicle:getPartByIndex(i);
                local customVars = part and part:getTable("CustomVariables");

                if customVars and customVars["seatIndex"] and customVars["seatIndex"] == seat
                then
                    if part and (not part:getItemType() or part:getInventoryItem())
                    then
                        local window = part:getWindow();

                        if window:isOpenable() and not window:isDestroyed()
                        then
                            if window:isOpen()
                            then
                                menu:addSlice(getText("ContextMenu_Close_window"), getTexture("media/ui/vehicles/vehicle_windowCLOSED.png"), ISVehiclePartMenu.onOpenCloseWindow, playerObj, part, false);
                            else
                                menu:addSlice(getText("ContextMenu_Open_window"), getTexture("media/ui/vehicles/vehicle_windowOPEN.png"), ISVehiclePartMenu.onOpenCloseWindow, playerObj, part, true);
                            end
                        end
                    end
                    
                    break;
                end
            end
        end
    end
end