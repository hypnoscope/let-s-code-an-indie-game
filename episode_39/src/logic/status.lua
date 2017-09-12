local status = {}

status.ticks = function (frames)
  return frames * (1/60)
end

local tick = function (self, owner, game)
  self.time = self.time + (1 * game.dt)

  if self.onTick then self:onTick(owner, game) end

  if self.time >= self.duration then
    if self.onDone then self:onDone(owner, game) end
    owner:removeStatus(self)
  end

end

status.create = function (duration, onDone, onApply, onTick)
  local inst = {}

  if onApply then onApply() end

  inst.time = 0
  inst.duration = duration
  inst.onDone = onDone
  inst.onTick = onTick

  inst.tick = tick

  return inst
end

return status
