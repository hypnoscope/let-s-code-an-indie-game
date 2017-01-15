local entity = {}

local draw = function (self)
  self.sprite:draw(self.drawX, self.drawY)
end

local update = function (self, game)
  self.movement.update(self, game)
  self.drawX = self.x
  self.drawY = self.y - self.z/2
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

  return inst
end

return entity
