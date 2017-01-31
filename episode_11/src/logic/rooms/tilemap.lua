local tilemap = {}

local draw = function (self, view, tilesheet)
  for i = 1, #self.map do
    local char = self.map:sub(i,i)
    local x = ((i-1) % self.tileWidth) * tilesheet.tileSize
    local y = math.floor((i-1) / self.tileWidth) * tilesheet.tileSize

    if char == "x" then tilesheet:drawTile(view, x, y, 1, 1) end
    if char == "." then tilesheet:drawTile(view, x, y, 1, 2) end
  end
end

tilemap.create = function ()
  local inst = {}

  inst.tileWidth = 50
  inst.tileHeight = 22

  local map = [[
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
  x................................................x
  x.....xxxxxxxxxxxxxxxxxxxxxxxxxx.................x
  x................................................x
  x................................................x
  x.........................xxxxxxxxxxxxxxx........x
  x................................................x
  x................................................x
  x........xxxxxxxxxxxxxxxxxx......................x
  x................................................x
  x................................................x
  x........................xxxxxxxxxxxxxxxx........x
  x................................................x
  x.............xxxxxxxxxxxxxxxxx..................x
  x................................................x
  x................................................x
  x....xxxxxxxxxxxxx.............xxxxxxxxxxx.......x
  x................................................x
  x.................xxxxxxxxxxxx...................x
  x....xxx...........................xxxxxxx.......x
  x................................................x
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
  ]]

  local whitespace = "%s"
  local nothing = ""
  inst.map = map:gsub(whitespace, nothing)

  inst.draw = draw

  return inst
end

return tilemap
