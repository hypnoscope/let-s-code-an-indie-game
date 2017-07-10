local status = require("src.logic.status")

local removeSelf = {}

removeSelf.create = function (duration)
  local inst = status.create(
    status.ticks(duration),
    function (_, owner, game)
      owner:done()
    end)

  return inst
end

return removeSelf
