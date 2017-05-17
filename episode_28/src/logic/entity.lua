local rectangle = require("src.math.rectangle")
local status = require("src.logic.status")
local iframes = require("src.logic.statuses.iframes")


local entity = {}

local draw = function (self, view)
  if self.visible then self.sprite:draw(
      view,
      self.position.drawX,
      self.position.drawY,
      self.position.left
    )
  end
  if DEBUG then
    view:inContext(function ()
      love.graphics.print(
        self.position:toString(),
        self.position.drawX,
        self.position.drawY)
      if self.debugColor then love.graphics.setColor(self.debugColor) end
      love.graphics.polygon("line", self.boundingBox:getPoints())
    end)
  end
end

local update = function (self, game)
  if self.iframes and game:modulate() then
    self.visible = false
  else
    self.visible = true
  end
  if self.sprite.update then self.sprite:update(game) end
  for _, status in ipairs(self.statuses) do status:tick(self, game) end
  if self.movement then self.movement.update(self, game) end
  self.boundingBox:update(self.position.x, self.position.z)
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

local addStatus = function (self, status)
  table.insert(self.statuses, status)
end

local removeStatus = function (self, statusToRemove)
  for i, status in ipairs(self.statuses) do
    if status == statusToRemove then
      table.remove(self.statuses, i)
    end
  end
end

local takeDamage = function (self, damage)
  if self.vulnerable then
    self.hp = self.hp - damage
    if self.hp <= 0 then
      self:done()
    else
      self:addStatus(iframes.create(100, self))
    end
  end
end

entity.create = function (sprite, position, speed, movement, collision)
  local inst = {}

  inst.statuses = {}
  inst.finished = false
  inst.sprite = sprite
  inst.position = position
  inst.speed = speed
  inst.movement = movement
  inst.collision = collision
  inst.boundingBox = rectangle.create(
    inst.position.x,
    inst.position.z,
    sprite.size,
    sprite.size
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
  inst.addStatus = addStatus
  inst.removeStatus = removeStatus
  inst.takeDamage = takeDamage

  return inst
end

return entity
