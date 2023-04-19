Box = require("components/Box")



Stage = {}
Stage.__index = Stage
function Stage:new()
    local self = setmetatable({},Stage)
    self.compontes = {}
    self.box = {}
    self:execute()
    return self
end

function Stage:addChild(component)
    self.box = component
end

function Stage:execute()
    print("oi")

    function love.load()
        love.window.setMode(1280, 720)
        love.window.setTitle("View Engine")

    end


    function love.draw()
        if self.box.draw and type(self.box.draw) == "function" then
            self.box:draw()
        end
        love.graphics.print("FPS: " .. tostring(love.timer.getFPS()), 10, 10)
    end
end


local stage = Stage:new()
local box = Box:new(100, 100, 200, 150, 60)
stage:addChild(box)


