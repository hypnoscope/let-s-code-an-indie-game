local entity = require('src.logic.entity')
local tiledSprite = require('src.graphics.tiled_sprite')
local removeSelf = require('src.logic.statuses.remove_self')

local lightning = {}

local sprite = tiledSprite.create(
  'assets/sprites/fx/lightning.png', 1, 8)

lightning.create = function (pos, duration)
  local inst = entity.create(sprite, pos)

  inst:addStatus(removeSelf.create(duration))

  return inst
end

return lightning
