local vector = require("src.math.vector")

local entity = {}

local _positionString = function (self)
  return math.floor(self.x) .. "," .. math.floor(self.y) .. "," .. math.floor(self.z)
end

local draw = function (self, view)
  self.sprite:draw(view, self.drawX, self.drawY)
  if DEBUG then
    view:inContext(function ()
      love.graphics.print(_positionString(self), self.drawX, self.drawY)
    end)
  end
end

local toPosition = function (self)
  return {
    x=self.x,
    y=self.y,
    z=self.z
  }
end


local update = function (self, game)
  self.movement.update(self, game)
  local screenPos = vector.worldToScreen(toPosition(self))
  self.drawX = screenPos.x
  self.drawY = screenPos.y
end

entity.create = function (sprite, x, y, z, speed, movement)
  local inst = {}

  inst.sprite = sprite
  inst.x = x
  inst.y = y
  inst.z = z
  inst.drawX = x
  inst.drawY = y - z/2
  inst.speed = speed
  inst.movement = movement

  inst.draw = draw
  inst.update = update
  inst.toPosition = toPosition

  return inst
end

return entity
