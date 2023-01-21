local GameView = {}

-- Esqueminha para o lua aceitar a classe(pseudo-construtor)
function GameView:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.square = {}
    self.load(self)
    return o
end

function GameView.load(self)
    -- inicializando variaveis
    self.scareX = 100
    self.square = {
        x = 0,
        y = 220,
        width = 50,
        height = 50,
        speed = 100
    }
end

function GameView.update(self,dt)
    self.square.x =  self.square.x +  self.square.speed * dt
    if  self.square.x > love.graphics.getWidth() then
        self.square.speed = - self.square.speed
    end
    if  self.square.x < 0 then
        self.square.speed = - self.square.speed
    end
end
function GameView.draw(self)
    -- print(self.square.x)
    love.graphics.rectangle("fill", self.square.x, self.square.y, self.square.width, self.square.height)
    love.graphics.print("Jogo em Andamento", 100, 200)
end

return GameView
