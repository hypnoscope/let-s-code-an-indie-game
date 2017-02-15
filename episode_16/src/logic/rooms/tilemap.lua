local tilemap = {}

local getTile = function (self, x, y, tileSize)
  local i = (math.floor(x / tileSize) + math.floor(y / tileSize) * self.tilesWide) + 1

  self.lastGotTile = i

  return self.map:sub(i,i)
end

local draw = function (self, view, tilesheet)
  for i = 1, #self.map do
    local char = self.map:sub(i,i)
    local x = ((i-1) % self.tilesWide) * tilesheet.tileSize
    local y = math.floor((i-1) / self.tilesWide) * tilesheet.tileSize

    if char == "x" then tilesheet:drawTile(view, x, y, 2, 1) end
    if char == "^" then tilesheet:drawTile(view, x, y, 4, 1) end
    if char == "=" then tilesheet:drawTile(view, x, y, 3, 1) end
    if char == "." then tilesheet:drawTile(view, x, y, 1, 2) end
    if char == "," then tilesheet:drawTile(view, x, y, 2, 2) end
    if char == "s" then tilesheet:drawTile(view, x, y, 4, 2) end
    if char == "X" then tilesheet:drawTile(view, x, y, 3, 2) end
    if char == "v" then tilesheet:drawTile(view, x, y, 1, 3) end

    if DEBUG and i == self.lastGotTile then
      view:inContext(function ()
        love.graphics.rectangle(
          "line", x, y, tilesheet.tileSize, tilesheet.tileSize)
      end)
    end
  end
end

tilemap.create = function ()
  local inst = {}

  inst.tilesWide = 50
  inst.tilesHeigh = 22
  inst.lastGotTile = 0

  local map = [[
  ^^^^^^^^^^^^^^^^^^^^^XXX^^^^^^^^^^^^^^^^^^^^^^^^^^
  xxxxxxxxxxxxxxxxxxxxxXXXxxxxxxxxxxxxxxxxxxxxxxxxxx
  xxxxxxxxxxxxxxxxxxxxxXXXxxxxxxxxxxxxxxxxxxxxxxxxxx
  xxxxxxxxxxxxxxxxxxxxxXXXxxxxxxxxxxxxxxxxxxxxxxxxxx
  =====================XXXxxxxxxxxxxxxxxxxxxxxxxxxxx
  .....................sXXxxxxxxxxxxxxxxxxxxxxxxxxxx
  ......................sXxxxxxxxxxxxxxxxxxxxxxxxxxx
  .......................s==========================
  ......,...........................................
  ..................................................
  ..................................................
  .....................,............................
  ..................................................
  ..................................................
  ..................................................
  ...................................,..............
  vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
  xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
  ]]

  local whitespace = "%s"
  local nothing = ""
  inst.map = map:gsub(whitespace, nothing)

  inst.draw = draw
  inst.getTile = getTile

  return inst
end

return tilemap
