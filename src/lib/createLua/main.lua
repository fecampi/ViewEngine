Box = require("components/Box")
Stage = require("components/Stage")


local stage = Stage:new()
local box = Box:new(100, 100, 200, 150, 60)
local box1 = Box:new(200, 200, 200, 150, 60)
stage:addChild(box)
stage:addChild(box1)


