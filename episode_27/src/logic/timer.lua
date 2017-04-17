local timer = {}

timer.ticks = function (frames)
  return frames * (1/60)
end

local tick = function (self, owner, game)
  self.time = self.time + (1 * game.dt)

  if self.time >= self.duration then
    self:onDone(owner, game)
    owner:removeTimer()
  end

end

timer.create = function (duration, onDone)
  local inst = {}

  inst.time = 0
  inst.duration = duration
  inst.onDone = onDone

  inst.tick = tick

  return inst
end

return timer
