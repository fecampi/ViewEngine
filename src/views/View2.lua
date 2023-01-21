local View2 = {}

-- Esqueminha para o lua aceitar a classe(pseudo-construtor)
function View2:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.square = {}
    self.load(self)
    return o
end

function View2.load(self)
    -- inicializando variaveis
    self.scareX = 100
    self.square = {
        x = 0,
        y = 200,
        width = 50,
        height = 50,
        speed = 100
    }
end

function View2.update(self,dt)
    self.square.x =  self.square.x +  self.square.speed * dt
    if  self.square.x > love.graphics.getWidth() then
        self.square.speed = - self.square.speed
    end
    if  self.square.x < 0 then
        self.square.speed = - self.square.speed
    end
end
function View2.draw(self)
    love.graphics.rectangle("fill", self.square.x, self.square.y, self.square.width, self.square.height)
    love.graphics.print("View2", 50, self.square.y-20)


end

return View2
