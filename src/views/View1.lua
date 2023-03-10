local Square = {}

function Square:new(o)
    local o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.load(self)
    return o
end

function Square:load()
    -- inicializando variaveis
    self.x = 0
    self.y = 100
    self.width = 50
    self.height = 50
    self.speed = 100
end

function Square:update( dt)
    self.x = self.x + self.speed * dt
    if self.x > love.graphics.getWidth() then
        self.speed = -self.speed
    end
    if self.x < 0 then
        self.speed = -self.speed
    end
end

function Square:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

local View1 = {}

function View1:new(o)
    local o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.load(self)
    return o
end

function View1:load()
    -- inicializando variaveis
    self.square = Square:new()
end

function View1:update(dt)
    self.square:update(dt)
end

function View1:draw()
    self.square:draw()
    love.graphics.print("View1", 50, self.square.y-20)
end

return View1