CreateThread(function()
  local _sleep = true
  while (Config.DisableQ) do
    local _ped = PlayerPedId()
    local _health = GetEntityHealth(_ped)
    local _healthCheck = health >= 101
    _sleep = not (_healthCheck)
    if (_healthCheck) then
      DisableControlAction(0, 44, true)
    end
    Wait(_sleep and 750 or 0)
  end
end)
