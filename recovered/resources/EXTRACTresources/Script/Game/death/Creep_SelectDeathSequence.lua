local chosenDeathSequence = "Normal Death"
GameScript.Callbacks.RegisterForDeathSequenceSelectCallback("ChooseDeathSequence")

function ChooseDeathSequence()
  GameScript.Game.Death.SetDeathChoreographerSequence(chosenDeathSequence)
end
