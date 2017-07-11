local controller = {}

local pushState = function (self, state)
  table.insert(self.states, state)
end

local popState = function (self)
  table.remove(self.states, #self.states)
end

local _getActiveState = function (self)
  return self.states[#self.states]
end

local update = function (self, dt)
  _getActiveState(self):update(dt)
end

local draw = function (self)
  _getActiveState(self):draw()
end

local keypressed = function (self, key)
  _getActiveState(self):keypressed(key)
end

local create = function ()
  local inst = {}

  inst.states = {}

  inst.update = update
  inst.draw = draw
  inst.keypressed = keypressed
  inst.pushState = pushState
  inst.popState = popState

  return inst
end

local theController = nil

controller.get = function ()
  if theController == nil then
    theController = create()
  end

  return theController
end

return controller
