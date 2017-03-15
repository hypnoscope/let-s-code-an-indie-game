local timer = {}

local tick = function (self, owner, game)
  self.ticks = self.ticks + 1

  if self.ticks == self.duration then
    self:onDone(owner, game)
    owner:removeTimer()
  end

end

timer.create = function (duration, onDone)
  local inst = {}

  inst.ticks = 0
  inst.duration = duration
  inst.onDone = onDone

  inst.tick = tick

  return inst
end

return timer
