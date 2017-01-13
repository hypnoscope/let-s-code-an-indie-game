local entity = {}

local draw = function (self)
  self.sprite:draw(self.x, self.y)
end

local update = function (self)
  local moving = false
  if love.keyboard.isDown("right") and not moving then
    self.x = self.x + self.speed
    moving = true
  end
  if love.keyboard.isDown("left") and not moving then
    self.x = self.x - self.speed
    moving = true
  end
  if love.keyboard.isDown("up") and not moving then
    self.y = self.y - self.speed
    moving = true
  end
  if love.keyboard.isDown("down") and not moving then
    self.y = self.y + self.speed
    moving = true
  end
end

entity.create = function (sprite, x, y, speed)
  local inst = {}

  inst.sprite = sprite
  inst.x = x
  inst.y = y
  inst.speed = speed

  inst.draw = draw
  inst.update = update

  return inst
end

return entity
