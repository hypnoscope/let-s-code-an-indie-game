local vector = require("src.math.vector")

local position = {}

local toString = function (self)
  return math.floor(self.x) .. "," ..
         math.floor(self.y) .. "," ..
         math.floor(self.z)
end

local _updateDrawPosition = function (self)
  local drawPosition = vector.worldToScreen(
    {x=self.x, y=self.y, z=self.z}
  )
  self.drawX = drawPosition.x
  self.drawY = drawPosition.y
end

local setPosition = function (self, x, y, z)
  self.x = x
  self.y = y
  self.z = z
  _updateDrawPosition(self)
end

local faceLeft = function (self)
  self.left = true
end

local faceRight = function (self)
  self.left = false
end

position.create = function (x, y, z, left)
  local inst = {}

  inst.x = x
  inst.y = y
  inst.z = z
  inst.drawX = nil
  inst.drawY = nil
  inst.left = left
  _updateDrawPosition(inst)

  inst.toString = toString
  inst.setPosition = setPosition
  inst.faceLeft = faceLeft
  inst.faceRight = faceRight

  return inst
end

return position
