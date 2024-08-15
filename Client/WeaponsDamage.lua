CreateThread(function()
  while (Config.WeaponsDamage) do
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"), 0.4)
    N_0x4757f00bc6323cfe(GetHashKey("WEAPON_NIGHTSTICK"), 0.1)
    DisableControlAction(0, 44, true)
  end
end)

CreateThread(function()
  local _sleep = true
  while (Config.WeaponsDamage) do
    local _ped = PlayerPedId()
    _sleep = not IsPedArmed(_ped, 6)
    if (not _sleep) then
      DisableControlAction(1, 140, true)
      DisableControlAction(1, 141, true)
      DisableControlAction(1, 142, true)
    end
    Wait(_sleep and 750 or 0)
  end
end)
