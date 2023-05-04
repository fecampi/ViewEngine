local GraphicServices = {}

function GraphicServices:new()
    local obj = {}
    setmetatable(obj, self)
    self.__index = self
    return obj
end



function GraphicServices:drawRect(params)
    local color = params and params.color or  {1, 1, 1}
    local x = params and params.x
    local y = params and params.y
    local width = params and params.width
    local height = params and params.height
    local cornerRadius = params and params.cornerRadius
    local borderColor = params and params.borderColor
    local borderWidth = params and params.borderWidth

    -- Define a cor do conteúdo interno do box
    love.graphics.setColor(color)
    -- Desenha o conteúdo interno do box
    love.graphics.rectangle("fill", x, y, width, height, cornerRadius, cornerRadius)
    -- Define a largura da linha para o conteúdo interno do box
    love.graphics.setLineWidth(borderWidth)
    -- Define a cor da borda do box
    love.graphics.setColor(borderColor)
    -- Desenha a borda do box
    love.graphics.rectangle("line", x, y, width, height, cornerRadius, cornerRadius)
end


function GraphicServices:drawText(params)
    local color = params and params.color or  {1, 1, 1}
    local x = params and params.x
    local y = params and params.y
    local font = params and params.font
    local text = params and params.text

   -- Define a cor do texto
    love.graphics.setColor(color)
    love.graphics.setFont(font)
    love.graphics.print(text, x, y)
end




return GraphicServices

