local tilemap = require("src.logic.rooms.tilemap")

local dungeonRoomFloorplan = [[
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

return tilemap.create(
  dungeonRoomFloorplan,
  50,
  nil,
  {x=2, y=0, z=90},
  {x=386, y=0, z=90})
