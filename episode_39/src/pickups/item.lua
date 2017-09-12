local entity = require("src.logic.entity")

local item = {}

local pickupSound = love.audio.newSource(
  "assets/sounds/collect_item.wav",
  "static")

local collision = function (self, entity, game)
  if entity == game:getPlayer() then
    local inventory = game:getInventory()
    pickupSound:play()
    inventory:setItem(self.__item)
    self:done()
  end
end

item.create = function (pos, itemClass)
  local speed = 0
  local movement = nil
  local inst = entity.create(
    itemClass.SPRITE,
    pos,
    speed,
    movement,
    collision)

  inst.__item = itemClass

  return inst
end

return item
