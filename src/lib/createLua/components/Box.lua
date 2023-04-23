--[[
The Rect class is a graphics object that represents a rectangular shape. 
It is based on the EaselJS library's Graphics.Rect class,
 which can be found at https://createjs.com/docs/easeljs/classes/Graphics.Rect.html.
]]
local Rect = {}
Rect.__index = Rect
-- Construtor da classe Rect
function Rect:new(x, y, width, height, cornerRadius)
    local self = setmetatable({}, Rect)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.cornerRadius = cornerRadius
    self.borderWidth = 5
    self.borderColor = {0, 1, 0,191} -- verde
    self.boxColor = {0, 0, 1,191} -- azul
    self.alpha = 1
    return self
end

-- Função de desenho do box
function Rect:draw()
    -- Define a cor da borda do box
    love.graphics.setColor(self.borderColor)
    -- Define a largura da linha para a borda
    love.graphics.setLineWidth(self.borderWidth)
    -- Desenha a borda arredondada do box
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height, self.cornerRadius, self.cornerRadius)
    -- Define a cor do conteúdo interno do box
    love.graphics.setColor(self.boxColor)
    -- Desenha o conteúdo interno do box
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height, self.cornerRadius, self.cornerRadius)
    -- Define a largura da linha para o conteúdo interno do box
    love.graphics.setLineWidth(1)
end

return Rect