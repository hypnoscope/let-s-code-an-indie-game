local followPlayer = require("src.logic.ai.movement.follow_player")
local bounce = require("src.logic.ai.movement.bounce")

local bounceAfterPlayer = {}

bounceAfterPlayer.update = function (entity, game)
  followPlayer.update(entity, game)
  bounce.update(entity, game)
end

return bounceAfterPlayer
