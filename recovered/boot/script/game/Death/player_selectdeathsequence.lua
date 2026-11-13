local Death = GameScript.Game.Death
local Callbacks = GameScript.Callbacks
local Print = GameScript.Debug.PrintInfo
local chosenDeathSequence = "Ragdoll Death"
Callbacks.RegisterForDeathSequenceSelectCallback("ChooseDeathSequence")
Callbacks.RegisterForMsg(GameScript.MsgCallback.TextMessage, GameScript.Game.GetMyObject(), "OnTextMessage")

function ChooseDeathSequence()
  Death.SetDeathChoreographerSequence(chosenDeathSequence)
end

function OnTextMessage(message)
  if message.text == "Drowned" then
    chosenDeathSequence = "Drowning Death"
  end
  if message.text == "Ragdoll" then
    chosenDeathSequence = "Ragdoll Death"
  end
end
