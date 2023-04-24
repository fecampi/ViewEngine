--[[
The Stage class is a container that represents the root of the display list hierarchy. 
It is the top-level object that manages everything that is drawn on the canvas.
This class is based on the EaselJS documentation for Stage found at https://createjs.com/docs/easeljs/classes/Stage.html.
]]


Stage = {} 
Stage.__index = Stage

function Stage:new()
    local self = setmetatable({}, Stage)
    self.components = {} -- corrected spelling of "components"
    self:execute()
    return self
end

function Stage:addChild(component)
    table.insert(self.components, component) -- corrected spelling of "components" and fixed the use of the insert function
end

function Stage:execute()
    function love.load()
        love.window.setMode(1280, 720)
        love.window.setTitle("View Engine")
    end

    function love.draw()
        for _, component in ipairs(self.components) do
            if component.draw and type(component.draw) == "function" then
                component:draw()
            end
        end
        love.graphics.print("FPS: " .. tostring(love.timer.getFPS()), 10, 10)
    end
end

return Stage
