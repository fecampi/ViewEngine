local View = {}
View.__index = View

function View:new(name)
    local self = setmetatable({}, self)
    self.name = name or ""
    self.components = {}
    self.grid = {}
    return self
end

function View:addBox(x, y, width, height)
    local component = Box:new(x, y, width, height)
    self.components[component] = component
    return component
end

function View:addButton(options)
    local component = Button:new(options)
    self.components[component] = component
    return component
end

function View:addVideo(filename)
    local video = Video:new(filename)
    self.components[video] = video
end

function View:tween(obj)
    print("tweening" .. " " .. self.name)
    self.components[obj.target]:createTweenAnimation(obj)
end

function View:update(dt)
    for _, component in pairs(self.components) do
        if component.update and type(component.update) == "function" then
            component:update(dt)
        end
    end
end

function View:draw()
    for _, component in pairs(self.components) do
        if component.draw and type(component.draw) == "function" then
            component:draw()
        end
    end
end

function View:keypressed(key)
    for _, component in pairs(self.components) do
        if component.keypressed and type(component.keypressed) == "function" and component.isFocused then
            component:keypressed(key)
        end
    end
end

return View
