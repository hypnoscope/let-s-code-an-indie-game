local entity = {}

local draw = function (self, view)
  self.sprite:draw(view, self.drawX, self.drawY)
end

local update = function (self, game)
  self.movement.update(self, game)
  self.drawX = self.x
  self.drawY = self.y - self.z/2
end

local toPosition = function (self)
  return {
    x=self.x,
    y=self.y,
    z=self.z
  }
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
