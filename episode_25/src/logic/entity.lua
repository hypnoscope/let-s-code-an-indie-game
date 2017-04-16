local vector = require("src.math.vector")
local rectangle = require("src.math.rectangle")
local timer = require("src.logic.timer")

local entity = {}

local _positionString = function (self)
  return math.floor(self.x) .. "," .. math.floor(self.y) .. "," .. math.floor(self.z)
end

local draw = function (self, view)
  if self.visible then self.sprite:draw(view, self.drawX, self.drawY) end
  if DEBUG then
    view:inContext(function ()
      love.graphics.print(_positionString(self), self.drawX, self.drawY)
      if self.debugColor then love.graphics.setColor(self.debugColor) end
      love.graphics.polygon("line", self.boundingBox:getPoints())
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
  if self.iframes and game:modulate() then
    self.visible = false
  else
    self.visible = true
  end
  if self.sprite.update then self.sprite:update(game) end
  if self.timer then self.timer:tick(self, game) end
  if self.movement then self.movement.update(self, game) end
  self.boundingBox:update(self.x, self.z)
  local screenPos = vector.worldToScreen(toPosition(self))
  self.drawX = screenPos.x
  self.drawY = screenPos.y
end

local collisionCheck = function (self, ent, game)
  if self == ent then return end
  if self.boundingBox:overlaps(ent.boundingBox) then
    self.debugColor = {255, 0, 255}
    if self.collision then self:collision(ent, game) end
  end
end

local done = function (self)
  self.finished = true
end

local addTimer = function (self, timer)
  self.timer = timer
end

local removeTimer = function (self)
  self.timer = nil
end

local takeDamage = function (self, damage)
  if self.vulnerable then
    self.hp = self.hp - damage
    if self.hp <= 0 then
      self:done()
    else
      self.vulnerable = false
      self.iframes = true
      self:addTimer(timer.create(timer.ticks(20), function (_, ent, game)
        ent.vulnerable = true
        ent.iframes = false
      end))
    end
  end
end

entity.create = function (sprite, x, y, z, speed, movement, collision)
  local inst = {}

  inst.finished = false
  inst.sprite = sprite
  inst.x = x
  inst.y = y
  inst.z = z
  inst.drawX = x
  inst.drawY = y - z/2
  inst.speed = speed
  inst.movement = movement
  inst.collision = collision
  inst.boundingBox = rectangle.create(
    x,
    z,
    sprite.image:getWidth(),
    sprite.image:getHeight()
  )
  inst.interuptMovement = false
  inst.vulnerable = true
  inst.hp = 5
  inst.iframes = false
  inst.visible = true

  inst.draw = draw
  inst.update = update
  inst.toPosition = toPosition
  inst.collisionCheck = collisionCheck
  inst.done = done
  inst.addTimer = addTimer
  inst.removeTimer = removeTimer
  inst.takeDamage = takeDamage

  return inst
end

return entity
