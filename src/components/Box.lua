local Box = {}
function Box:new(x, y, width, height)
    local o = o or {}
    setmetatable(o, self)
    self.__index = self
    o.tweenAnimation = undefined
    o.rectProps = {
        x = x,
        y = y,
        width = width,
        height = height,
        borderWidth = 5,
        borderColor = {0, 1, 0}, -- verde
        boxColor = {0, 0, 1} -- azul
    }
    return o
end

function Box:createTweenAnimation(props)
    local rectTween = {
        subject = self.rectProps,
        options = props.options,
        tweens = props.tweens
    }
    self.tweenAnimation = TweenAnimation:new(rectTween)
end

function Box:update(dt)
    if self.tweenAnimation == undefined then
        return
    end
    self.tweenAnimation:update(dt)
end

function Box:draw()
    -- Define a cor da borda
    love.graphics.setColor(self.rectProps.borderColor)

    -- Define a largura da linha para a borda
    love.graphics.setLineWidth(self.rectProps.borderWidth)
    
    -- Desenha a borda do box
    love.graphics.rectangle("line", self.rectProps.x, self.rectProps.y, self.rectProps.width, self.rectProps.height)
    -- Define a cor do conteúdo interno do box
    love.graphics.setColor(self.rectProps.boxColor)
    -- Desenha o conteúdo interno do box
    love.graphics.rectangle("fill", self.rectProps.x, self.rectProps.y, self.rectProps.width, self.rectProps.height)
    -- Define a largura da linha para o conteúdo interno do box
    love.graphics.setLineWidth(1)
end

return Box
