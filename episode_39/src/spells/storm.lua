local stun = require("src.logic.statuses.stun")
local lightning = require('src.mobs.fx.lightning')

local storm = {}

local stormSound = love.audio.newSource("assets/sounds/storm.wav", "static")
local nopeSound = love.audio.newSource("assets/sounds/nope.wav", "static")

local cast = function (self, game)
  local room = game.map:currentRoom()
  local inventory = game:getInventory()
  local potionCount = inventory:getPotions()
  local stunTime = 50

  if potionCount >= self.spellCost then
    inventory:setPotions(potionCount - self.spellCost)
    stormSound:play()
    for _, mob in ipairs(room:getEntities()) do
      if mob.is == 'enemy' then
        mob:takeDamage(self.spellDamage)
        mob:addStatus(stun.create(stunTime, mob))
        room:addEntity(lightning.create(mob:getPosition(), stunTime))
      end
    end
  else
    nopeSound:play()
  end
end

storm.create = function ()
  local inst = {}

  inst.spellDamage = 3
  inst.spellCost = 3

  inst.cast = cast

  return inst
end

return storm
