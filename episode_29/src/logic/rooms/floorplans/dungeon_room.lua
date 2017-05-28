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

return tilemap.create(dungeonRoomFloorplan)
