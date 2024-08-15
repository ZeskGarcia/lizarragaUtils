CreateThread(function()
  if (Config.NoNPC) then
    print("^0[^2SUCCESS^0] ^4NoNPC^0 ^2successfully ^3started^0")
  end
  while (Config.NoNPC) do
    Wait(0)
    if (Config.NoNPC) then
      local _ped = PlayerPedId()
      local _coords = GetEntityCoords(_ped)

      local x,y,z = table.unpack(_coords)
      ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
      RemoveVehiclesFromGeneratorsInArea(x - 500.0, y - 500.0, z - 500.0, x + 500.0, y + 500.0, z + 500.0)

      SetCreateRandomCops(false)
      SetCreateRandomCopsNotOnScenarios(false)
      SetCreateRandomCopsOnScenarios(false)
      SetGarbageTrucks(false)
      SetRandomBoats(false)
      SetVehicleDensityMultiplierThisFrame(0.0)
      SetPedDensityMultiplierThisFrame(0.0)
      SetRandomVehicleDensityMultiplierThisFrame(0.0)
      SetScenarioPedDensityMultiplierThisFrame(0.0, 0.0)
      SetParkedVehicleDensityMultiplierThisFrame(0.0)
    end
  end
end)
