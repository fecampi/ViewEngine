Button = {}
Button.__index = Button



function Button:new( options)
    local self = setmetatable({}, Button)
    self.x = options and options.x or 0
    self.y = options and options.y or 0
    self.text = options and options.text or ""
    self.font = options and options.font or love.graphics.getFont()
    self.borderWidth = options and options.borderWidth or 1
    self.style = Styles.getButtonStyle(options and options.variant or "default")
    self.alpha = options and options.alpha or 0.5
    self.cornerRadius = options and options.cornerRadius or 4
    self.paddingLeft = options and options.paddingLeft or 0
    self.paddingRight = options and options.paddingRight or 0
    self.paddingTop = options and options.paddingTop or 0
    self.paddingBottom = options and options.paddingBottom or 0
    self.tweenAnimation = undefined
    self.isHovered = false
    self.onSelected = options and options.onSelected or 0

    -- obtém a largura e a altura do texto usando a fonte especificada
    local textWidth = self.font:getWidth(self.text)
    local textHeight = self.font:getHeight()

    -- define a largura e a altura do botão com base na largura e altura do texto
    self.width = textWidth + 2 * self.borderWidth + self.paddingLeft + self.paddingRight
    self.height = textHeight + 2 * self.borderWidth + self.paddingTop + self.paddingBottom

    return self
end

function Button:setStyle(styleName)
    self.style = getButtonStyle(styleName) or self.style
end

function Button:createTweenAnimation(props)
    local rectTween = {
        subject = self,
        options = props.options,
        tweens = props.tweens
    }
    self.tweenAnimation = TweenAnimation:new(rectTween)
end

function Button:update(dt)
    local mouseX, mouseY = love.mouse.getPosition()
    local isMouseOver = mouseX >= self.x and mouseX <= self.x + self.width and mouseY >= self.y and mouseY <= self.y +
                            self.height
    if isMouseOver then
        self.isHovered = true
        -- verifica se o botão do mouse foi pressionado
        if love.mouse.isDown(1) then
            -- imprime a mensagem e define o triângulo como selecionado
            self.onSelected()
            self.isSelected = true
        end
    else
        self.isHovered = false
    end
    if self.tweenAnimation == undefined then
        return
    end
    self.tweenAnimation:update(dt)
end

function Button:draw()
    local color = {self.style.boxColor[1], self.style.boxColor[2], self.style.boxColor[3], self.alpha or 1}
    if self.isHovered then
        color = {self.style.hoverColor[1], self.style.hoverColor[2], self.style.hoverColor[3], self.alpha or 1}
    end

    -- medida do texto
    local textWidth = self.font:getWidth(self.text)
    local textHeight = self.font:getHeight()

    -- atualiza a largura e altura do botão de acordo com o tamanho do texto
    self.width = textWidth + self.borderWidth * 2 + self.paddingLeft + self.paddingRight
    self.height = textHeight + self.borderWidth * 2 + self.paddingTop + self.paddingBottom

    -- define a posição do texto dentro do botão
    local textX = self.x + self.paddingLeft + (self.width - textWidth - self.paddingLeft - self.paddingRight) / 2
    local textY = self.y + self.paddingTop + (self.height - textHeight - self.paddingTop - self.paddingBottom) / 2

    -- Define a cor do conteúdo interno do box
    love.graphics.setColor(color)
    -- Desenha o conteúdo interno do box
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height, self.cornerRadius, self.cornerRadius)
    -- Define a largura da linha para o conteúdo interno do box
    love.graphics.setLineWidth(self.borderWidth)
    -- Define a cor da borda do box
    love.graphics.setColor(self.style.borderColor)
    -- Desenha a borda do box
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height, self.cornerRadius, self.cornerRadius)

    -- Define a cor do texto
    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(self.font)
    love.graphics.print(self.text, textX, textY)
end

return Button
