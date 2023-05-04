Button = {}
Button.__index = Button

function Button:new(options)
    local self = setmetatable({}, Button)

    self.x = options and options.x or 0
    self.y = options and options.y or 0
    self.width = options and options.width or 0
    self.height = options and options.height or 0
    self.tweenAnimation = undefined
    self.cornerRadius = options and options.cornerRadius or 10

    self.style = Styles.getButtonStyle(options and options.variant or "default")

    local boxOptions = {
        x = self.x,
        y = self.y,
        options and options.cornerRadius or 4,
        borderWidth = options and options.borderWidth or 1,
        borderColor = self.style.borderColor,
        boxColor = options and options.boxColor or {0, 0, 1},
        alpha = 0.5
    }
    self.box = Box:new(boxOptions)

    self.text = options and options.text or ""
    self.font = options and options.font or love.graphics.getFont()
    self.borderWidth = options and options.borderWidth or 1

    self.paddingLeft = options and options.paddingLeft or 0
    self.paddingRight = options and options.paddingRight or 0
    self.paddingTop = options and options.paddingTop or 0
    self.paddingBottom = options and options.paddingBottom or 0
    self.tweenAnimation = undefined
    self.isHovered = false
    self.onSelected = options and options.onSelected or 0
    self.focusIndex = {}
    self.isFocused = options and options.isFocused or false
    self.onArrowRight = options and options.onArrowRight or false
    self.onArrowLeft = options and options.onArrowLeft or false

    -- obtém a largura e a altura do texto usando a fonte especificada
    local textWidth = self.font:getWidth(self.text)
    local textHeight = self.font:getHeight()


  -- define a largura e a altura do botão com base na largura e altura do texto
    self.box.width = textWidth + 2 * self.box.borderWidth + self.paddingLeft + self.paddingRight
    self.box.height = textHeight + 2 * self.box.borderWidth + self.paddingTop + self.paddingBottom


    return self
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
    if isMouseOver or self.isFocused then
        self.isHovered = true
        if love.mouse.isDown(1) then
            self.onSelected()
            self.isSelected = true
        end
    else

        if not self.isFocused then
            self.isHovered = false
        end

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

    self.box.color = {self.style.boxColor[1], self.style.boxColor[2], self.style.boxColor[3], self.alpha or 1}
    if self.isHovered then
        self.box.color = {self.style.hoverColor[1], self.style.hoverColor[2], self.style.hoverColor[3], self.alpha or 1}
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

    -- Desenha quadrado
    self.box:draw()

    -- Define a cor do texto
    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(self.font)
    love.graphics.print(self.text, textX, textY)

end

function Button:setStyle(styleName)
    self.style = getButtonStyle(styleName) or self.style
end

function Button:keypressed(key)
    print(key)

    if key == "left" and self.onArrowLeft then
        print("Pressionada esquerda!")
        self.onArrowLeft()
    end
    if key == "right" and self.onArrowRight then
        self.onArrowRight()
    end
    if key == "up" then
        print("Pressionada cima!")
    end
    if key == "down" then
        print("Pressionada baixo!")
    end
    if key == "return" and self.onSelected then
        self.onSelected()
    end
end

return Button
