local punch = require("src.items.punch")

local inventory = {}

local defaultItem = punch

local getItem = function (self)
  if self.currentItem == nil then
    return defaultItem
  else
    return self.currentItem
  end
end

local setItem = function (self, item)
  self.currentItem = item
end

local addPotion = function (self)
  self.potionCount = self.potionCount + 1
end

inventory.create = function ()
  local inst = {}

  inst.currentItem = nil
  inst.potionCount = 0

  inst.getItem = getItem
  inst.setItem = setItem
  inst.addPotion = addPotion

  return inst
end

return inventory
