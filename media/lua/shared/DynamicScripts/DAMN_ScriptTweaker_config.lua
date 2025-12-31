require "DAMN_ScriptTweaker";

DAMN = DAMN or {};

Events.OnGameStart.Add(function()
    for sbVar, scriptFile in pairs({
        ["AllowVanillaVehicleDismantling"] = "recipes_damnDismantleVanillaVehicles.txt",
        ["AllowVanillaWorldItemDismantling"] = "recipes_damnDismantleWorldItems.txt",
    })
    do
        if SandboxVars.DAMN[sbVar]
        then
            DAMN.ScriptTools:loadScriptInModFolder("damnlib", "dynamicScripts/" .. scriptFile);
        end
    end
end);