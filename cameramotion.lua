--
-- Lua dzVents Script
-- Set Camera Motion Sensor from ZoneMinder Event with zmeventserverDomoticz
--

-- Change this to your own needs in style like:
-- "ZoneMinder Monitor Name" = { idx = "Domoticz Motion Sensor Name" }
-- You can add more Monitors or delete some Monitors as well!
motionSensorsIdx = {
        Monitor1 = { idx = 1 },
        Monitor2 = { idx = 2 },
        Monitor3 = { idx = 3 },
        Monitor4 = { idx = 4 },
        Monitor5 = { idx = 5 },
        Monitor6 = { idx = 6 }
    }

return {
    on = {
        devices = {
            -- Change Camera Motion Dummy name if necessary:
            'Camera Motion Dummy'
        }
    },
    logging = {
        level = domoticz.LOG_DEBUG,
        marker = 'CameraMotion'
    },

    execute = function(domoticz, item)
        if(item.active) then
            local sValue = item.rawData[1]
            for key, value in pairs(motionSensorsIdx) do
                if(key == sValue) then
                    domoticz.log("Motion Sensor for Camera " ..key.. " (Idx: " ..value.idx.. ") now active!", domoticz.LOG_DEBUG)
                    domoticz.devices(value.idx).switchOn().checkFirst().forSec(30)
                end
            end
        end
    end
}
