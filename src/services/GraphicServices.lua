local GraphicServices = {}

function GraphicServices:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function GraphicServices:drawBox(x, y, w, h, boxColor, borderColor, borderWidth)
    -- Define a cor da borda do box
    love.graphics.setColor(borderColor)
    -- Define a largura da linha para a borda
    love.graphics.setLineWidth(borderWidth)
    -- Desenha a borda do box
    love.graphics.rectangle("line", x, y, w, h)

    -- Define a cor do conteúdo interno do box
    love.graphics.setColor(boxColor)
    -- Desenha o conteúdo interno do box
    love.graphics.rectangle("fill", x, y, w, h)

    -- Define a largura da linha para o conteúdo interno do box
    love.graphics.setLineWidth(1)
end

return GraphicServices

