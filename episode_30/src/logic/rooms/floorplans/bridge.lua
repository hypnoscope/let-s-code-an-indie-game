local tilemap = require("src.logic.rooms.tilemap")

local background =
  love.graphics.newImage("assets/backgrounds/test_background.png")

background:setFilter('nearest', 'nearest')

local bridgeFloorplan = [[
##################################################
##################################################
##################################################
##################################################
##################################################
##################################################
##################################################
##################################################
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
........................,.........................
..................................................
...................................,..............
.......,..........................................
..................................................
.........................,........................
..................................................
vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
]]

return tilemap.create(bridgeFloorplan, background)
