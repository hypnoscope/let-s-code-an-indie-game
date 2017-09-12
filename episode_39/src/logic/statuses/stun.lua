local status = require("src.logic.status")

local stun = {}

stun.create = function (duration, target)
  local inst = status.create(
    status.ticks(duration),
    function () target.interruptMovement = false end,
    function () target.interruptMovement = true end,
    nil
  )

  return inst
end

return stun
