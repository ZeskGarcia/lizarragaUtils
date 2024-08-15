CreateThread(function()
  if (Config.VehicleTireExplosion) then
    print("^0[^2SUCCESS^0] ^2Successfully^3 started^4 Vehicle Tire Explosion^0")
  end
  local _sleep = true
  
  while (Config.VehicleTireExplosion) do
    local _ped = PlayerPedId()
    local _inVehicle = (IsPedInAnyVehicle(_ped, false))

    if (_inVehicle) then
      local _car = GetVehiclePedIsIn(_ped, false)
      if (_car) then
        local _seatCheck = GetPedInVehicleSeat(_car, -1) == _ped
        _sleep = not _seatCheck
        if (_seatCheck) then
          local _tireCheck = (IsVehicleTyreBurst(_car, 0, true) or IsVehicleTyreBurst(_car, 1, true) or IsVehicleTyreBurst(_car, 2, true) or IsVehicleTyreBurst(_car, 3, true) or IsVehicleTyreBurst(_car, 4, true) or IsVehicleTyreBurst(_car, 5, true))
          if (_tireCheck) then
            SetVehicleUndriveable(_car, true)
          end
        end
      end
    end
    Wait(_sleep and 750 or 125)
  end
end)
