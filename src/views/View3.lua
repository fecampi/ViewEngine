local View3 = {}

-- Esqueminha para o lua aceitar a classe(pseudo-construtor)
function View3:new(o)
    local o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.square = {}
    self.load(self)
    return o
end

function View3:load()
    -- inicializando variaveis
    self.scareX = 100
    self.square = {
        x = 0,
        y = 320,
        width = 50,
        height = 50,
        speed = 100
    }
    self.video = love.graphics.newVideo("views/video720p.ogv")
    self.video:play()
end

function View3:update(dt)
    self.square.x = self.square.x + self.square.speed * dt
    if self.square.x > love.graphics.getWidth() then
        self.square.speed = -self.square.speed
    end
    if self.square.x < 0 then
        self.square.speed = -self.square.speed
    end
end
function View3:draw()
    -- Desenha o vídeo que está atrás do retângulo
    love.graphics.setColor(1, 1, 1) -- branco
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
    love.graphics.draw(self.video, 0, 0)
    love.graphics.rectangle("fill", self.square.x, self.square.y, self.square.width, self.square.height)
    love.graphics.print("View3", 50, self.square.y - 20)
end

return View3
