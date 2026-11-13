function OnTimer()
  GameScript.FEAR.SetDLCInventoryGroupOption()
end

GameScript.Callbacks.RegisterForTimer("OnTimer", 0, false)
