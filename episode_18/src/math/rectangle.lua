local vector = require("src.math.vector")

local rectangle = {}

local _axisOverlap = function (min1, min2, max1, max2)
  return (min1 < max2 and max1 > min2)
end

local overlaps = function (self, another)
  local xAxisOverlap = _axisOverlap(
    self.x,
    another.x,
    self.x + self.width,
    another.x + another.width
  )

  local zAxisOverlap = _axisOverlap(
    self.z,
    another.z,
    self.z + self.height,
    another.z + another.height
  )

  return (xAxisOverlap and zAxisOverlap)
end

local update = function (self, x, z)
  self.x = x - self.xOffset
  self.z = z - self.zOffset
end

local getPoints = function (self)
  local topLeft = vector.worldToScreen(
    {x=self.x, y=0, z=self.z}
  )
  local topRight = vector.worldToScreen(
    {x=self.x + self.width, y=0, z=self.z}
  )
  local bottomLeft = vector.worldToScreen(
    {x=self.x, y=0, z=self.z + self.height}
  )
  local bottomRight = vector.worldToScreen(
    {x=self.x + self.width, y=0, z = self.z + self.height}
  )

  -- put points into a table
  -- return the table

  return {
    topLeft.x,
    topLeft.y,
    topRight.x,
    topRight.y,
    bottomRight.x,
    bottomRight.y,
    bottomLeft.x,
    bottomLeft.y
  }
end

rectangle.create = function (x, z, width, height)
  local inst = {}

  inst.xOffset = width/2
  inst.zOffset = height/2
  inst.x = x - inst.xOffset
  inst.z = z - inst.zOffset
  inst.width = width
  inst.height = height

  inst.getPoints = getPoints
  inst.update = update
  inst.overlaps = overlaps

  return inst
end

return rectangle
