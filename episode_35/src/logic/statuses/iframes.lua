local status = require("src.logic.status")

local iframes = {}

iframes.create = function (duration, entity)
  return status.create(
    status.ticks(duration),
    function (_, ent, game)
      ent.vulnerable = true
      ent.iframes = false
    end,
    function ()
      entity.vulnerable = false
      entity.iframes = true
    end)
end

return iframes
