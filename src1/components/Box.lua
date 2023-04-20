local Box = {}
Box.__index = Box
-- Construtor da classe Box
function Box:new(x, y, width, height, cornerRadius)
    local self = setmetatable({}, Box)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.cornerRadius = cornerRadius
    self.borderWidth = 5
    self.borderColor = {0, 1, 0,191} -- verde
    self.boxColor = {0, 0, 1,191} -- azul
    return self
end

-- Função de desenho do box
function Box:draw()
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

return Box