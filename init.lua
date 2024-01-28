--[[
  A module to scale the screenresolution with Gamera automatically 
  while preserving the original aspect ratio
  
  this is free as in free of charge, do whatever you want with it.
  Credit would me nice, show me what you are doing with the module! :)
]]--
require("love")

local resolut = {
  window_width,
  window_height,
  original_width,
  original_height,
  ratio,
  screenOffsetX,
  screenOffsetY,
  gameraCam,
  debug = false
}
resolut.__index = resolut

function resolut.new(original_width, original_height, gameraCam)
  local self = {}
  setmetatable(self, resolut)
  self.original_width = original_width
  self.original_height = original_height
  self.gameraCam = gameraCam
  return self
end

function resolut:Resize()
  self.window_width, self.window_height = love.graphics.getDimensions()
  self.ratio = math.min(self.window_width/self.original_width, self.window_height/self.original_height)
  love.graphics.scale(self.rratio, self.ratio)
  --center camera window on screen
  local diffx = self.window_width - (self.original_width*self.ratio)
  local diffy = self.window_height - (self.original_height*self.ratio)
  if diffx ~= 0 then
    diffx = diffx/2
  end
  if diffy ~= 0 then
    diffy = diffy/2
  end
  self.screenOffsetX = diffx
  self.screenOffsetY = diffy
  if self.gameraCam then
    self.gameraCam:setWindow(diffx,diffy,self.original_width*self.ratio,self.original_height*self.ratio)
    self.gameraCam:setScale(self.window_width/self.original_width)
  end

  if debug then
    print("window_width = " .. tostring(self.window_width))
    print("window_height = " .. tostring(self.window_height))
    print("screenOffsetX = " .. tostring(self.screenOffsetX))
    print("screenOffsetY = " .. tostring(self.screenOffsetY))
  end
end

return resolut
