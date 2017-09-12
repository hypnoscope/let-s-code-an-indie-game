local status = require("src.logic.status")
local v = require("src.math.vector")

local knockback = {}

knockback.create = function (duration, entity, targetPos, strength)
  return status.create(
    status.ticks(duration),
    nil,
    nil,
    function (self, owner, game)
      local entityPos = entity.position
      local unitVector = v.normalise(targetPos, entityPos)
      local dX = unitVector.dx * strength * game.dt
      local dZ = unitVector.dz * strength * game.dt
      local newX = entityPos.x + dX
      local newZ = entityPos.z + dZ

      entity.position:setPosition(newX, entityPos.y, newZ)
    end
  )
end

return knockback
