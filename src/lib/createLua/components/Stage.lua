Stage = {} -- removed the empty curly braces, not needed
Stage.__index = Stage

function Stage:new()
    local self = setmetatable({}, Stage)
    self.components = {} -- corrected spelling of "components"
    self.box = {} -- removed this line since it's not used
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
