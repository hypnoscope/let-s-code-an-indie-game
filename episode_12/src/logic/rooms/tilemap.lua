local tilemap = {}

local draw = function (self, view, tilesheet)
  for i = 1, #self.map do
    local char = self.map:sub(i,i)
    local x = ((i-1) % self.tileWidth) * tilesheet.tileSize
    local y = math.floor((i-1) / self.tileWidth) * tilesheet.tileSize

    if char == "x" then tilesheet:drawTile(view, x, y, 2, 1) end
    if char == "^" then tilesheet:drawTile(view, x, y, 4, 1) end
    if char == "=" then tilesheet:drawTile(view, x, y, 3, 1) end
    if char == "." then tilesheet:drawTile(view, x, y, 1, 2) end
    if char == "," then tilesheet:drawTile(view, x, y, 2, 2) end
    if char == "s" then tilesheet:drawTile(view, x, y, 4, 2) end
    if char == "X" then tilesheet:drawTile(view, x, y, 3, 2) end
  end
end

tilemap.create = function ()
  local inst = {}

  inst.tileWidth = 50
  inst.tileHeight = 22

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
  ...........,......................................
  ..................................................
  ..................................................
  .........................,........................
  ..................................................
  ..................................................
  ]]

  local whitespace = "%s"
  local nothing = ""
  inst.map = map:gsub(whitespace, nothing)

  inst.draw = draw

  return inst
end

return tilemap
