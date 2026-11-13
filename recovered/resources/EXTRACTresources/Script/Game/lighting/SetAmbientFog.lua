local Support = GameScript.Support
local Game = GameScript.Game
local Graphics = Game.Graphics
fogType = {
  none = 0,
  depth = 1,
  height = 2
}
fogSource = {}
fogSource.color = 0
fogSource["cube map"] = 1
local fogValues = {
  near = 0,
  far = 0,
  max = 0,
  top = 0,
  bottom = 0,
  type = fogType.depth,
  source = fogSource.color
}
local fogObj = Support.ImportSingleObject("Ambient Fog Object", "Object that has the ambient light that we are going to control.")
Support.RegisterCurveTemplateVariable("Ambient Fog Curve", "Curve used to calculate new value of ambient fog based on player entering 'testRegion.'")
fogValues.type = Support.ImportEnumVariable("fogType", "Fog Type", "The type of fog: depth, height, or none")
fogValues.source = Support.ImportEnumVariable("fogSource", "Fog Color Source", "The source of the fog's color: either constant color or a cube map")
local fogTransitionTime = Support.ImportFloatVariableWithDefault("Fog Transition Time", "How quickly the fog should change value once the player enters 'testRegion.'", 0)
local fogAmbientColor = Support.ImportColorVariable("Fog Color", "Ambient Fog Color value.")
fogValues.near = Support.ImportFloatVariableWithDefault("Fog near plane distance", "Fog Near Plane", 0)
fogValues.far = Support.ImportFloatVariableWithDefault("Fog far plane distance", "Fog Far Plane", 100)
fogValues.max = Support.ImportFloatVariableWithDefault("Maximum amount of fog", "Max Fog", 1)
fogValues.top = Support.ImportFloatVariableWithDefault("Top of Fog", "For Top", 100)
fogValues.bottom = Support.ImportFloatVariableWithDefault("Bottom of Fog", "Fog Bottom", 0)
local setFogCubeMap = Support.ImportBoolVariable("Set Fog Cube Map", "Whether this should set the cube map on the fog")
Support.RegisterTextureVariable("Fog Diffuse Cube Map", "Texture to switch the fog diffuse ambient cube map to.")
if fogObj ~= nil then
  if setFogCubeMap then
    Graphics.SetFogCubeMap(fogObj, "Fog Diffuse Cube Map")
  else
    Graphics.SetFogColor(fogObj, "Ambient Fog Curve", fogTransitionTime, fogAmbientColor)
  end
  Graphics.SetFogValues(fogObj, "Ambient Fog Curve", fogTransitionTime, fogValues)
end
