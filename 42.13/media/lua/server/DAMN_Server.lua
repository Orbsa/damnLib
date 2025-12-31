DAMN = DAMN or {};

-- events

Events.OnClientCommand.Add(function(moduleName, command, playerObj, args)
	if moduleName == "that_damn_lib" and DAMN.Commands[command]
	then
		if DAMN["commandsDebug"]
		then
			DAMN:log("OnClientCommand: " .. tostring(moduleName) .. "." .. tostring(command));
		end

		args = args or {};

		if args["_vehicleId"]
		then
			vehicle = getVehicleById(args["_vehicleId"]);

			if vehicle
			then
				DAMN.BackCompat:migrateModData(vehicle);

				args["_vehicle"] = vehicle;
			end
		end

		DAMN.Commands[command](playerObj, args);
    elseif moduleName == "vehicle" and command == "setDoorOpen"
    then
        DAMN:log("vehicle.setDoorOpen command received: [" .. tostring(args["vehicle"]) .. " / " .. tostring(args["part"]) .. "]");

        DAMN.Commands.syncPartAnimation(playerObj, args, command);
	end
end);