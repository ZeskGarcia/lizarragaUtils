local crouched = false
local proned = false
local crouchKey = 36
local proneKey = 20
local movefwd = false
local movebwd = false

CreateThread(function()
  while (Config.Crouch) do
    local _ped = PlayerPedId()
    if (DoesEntityExist(_ped) and not IsEntityDead(_ped)) then
      ProneMovement()
      DisableControlAction(0, crouchKey, true)
      if (not IsPauseMenuActive()) then
        if (IsDisabledControlJustPressed(0, crouchKey) and not proned) then
          RequestAnimSet("move_ped_crouched")
          RequestAnimSet("MOVE_M@TOUGH_GUY@")
          
          while (not HasAnimSetLoaded("move_ped_crouched")) do
            Wait(100)
          end

          while (not HasAnimSetLoaded("MOVE_M@TOUGH_GUY@")) do
            Wait(100)
          end

          if (crouched and not proned) then
            ResetPedMovementClipset(_ped)
            ResetPedStrafeClipset(_ped)
            SetPedMovementClipset(_ped, "MOVE_M@TOUGH_GUY@", 0.5)
            crouched = false
          elseif (not crouched and not proned) then
            SetPedMovementClipset(_ped, "move_ped_crouched", 0.55)
            SetPedStrafeClipset(_ped, "move_ped_crouched_strafing")
            crouched = true
          end
        end
      end
    else
        crouched = false
    end
  end
end)

function SetProned()
	local _ped = PlayerPedId()
	ClearPedTasksImmediately(_ped)
	TaskPlayAnimAdvanced(_ped, "move_crawl", "onfront_fwd", GetEntityCoords(_ped), 0.0, 0.0, GetEntityHeading(_ped), 1.0, 1.0, 1.0, 46, 1.0, 0, 0)
end

function ProneMovement()
  if (proned) then
    local _ped = PlayerPedId()
    DisableControlAction(0, 23)
    if (IsControlPressed(0, 32) or IsControlPressed(0, 33)) then
      DisablePlayerFiring(_ped, true)
    elseif (IsControlJustReleased(0, 32) or IsControlJustReleased(0, 33)) then
      DisablePlayerFiring(_ped, false)
    end
    if (IsControlJustPressed(0, 32) and not movefwd) then
      movefwd = true
      TaskPlayAnimAdvanced(ped, "move_crawl", "onfront_fwd", GetEntityCoords(_ped), 1.0, 0.0, GetEntityHeading(_ped), 1.0, 1.0, 1.0, 47, 1.0, 0, 0)
    elseif (IsControlJustReleased(0, 32) and movefwd) then
      TaskPlayAnimAdvanced(ped, "move_crawl", "onfront_fwd", GetEntityCoords(_ped), 1.0, 0.0, GetEntityHeading(_ped), 1.0, 1.0, 1.0, 46, 1.0, 0, 0)
      movefwd = false
    end
    if (IsControlJustPressed(0, 33) and not movebwd) then
      movebwd = true
      TaskPlayAnimAdvanced(ped, "move_crawl", "onfront_bwd", GetEntityCoords(_ped), 1.0, 0.0, GetEntityHeading(_ped), 1.0, 1.0, 1.0, 47, 1.0, 0, 0)
    elseif (IsControlJustReleased(0, 33) and movebwd) then
      TaskPlayAnimAdvanced(ped, "move_crawl", "onfront_bwd", GetEntityCoords(_ped), 1.0, 0.0, GetEntityHeading(_ped), 1.0, 1.0, 1.0, 46, 1.0, 0, 0)
      movebwd = false
    end
    if (IsControlPressed(0, 34)) then
      SetEntityHeading(_ped, (GetEntityHeading(_ped) + 2.0))
    elseif (IsControlPressed(0, 35)) then
      SetEntityHeading(_ped, (GetEntityHeading(_ped) - 2.0))
    end
  end
end
