Button = {}
Button.__index = Button

function Button:new(x, y, width, height, text, font)
    local self = setmetatable({}, Button)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.text = text or ""
    self.font = font or love.graphics.getFont()
    self.borderWidth = 5
    self.borderColor = {0, 1, 0} -- verde
    self.boxColor = {0, 0, 1} -- azul
    self.alpha = 0.5
    self.cornerRadius = 16
    self.hoverColor = {1, 1, 1} -- branco
    self.tweenAnimation = undefined
    self.isHovered = false
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
    if isMouseOver then
        self.isHovered = true
          -- verifica se o botão do mouse foi pressionado
            if love.mouse.isDown(1) then
                -- imprime a mensagem e define o triângulo como selecionado
                print("Clicou no Button!")
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
    local color = {self.boxColor[1], self.boxColor[2], self.boxColor[3], self.alpha or 1}
    if self.isHovered then
        color = {self.hoverColor[1], self.hoverColor[2], self.hoverColor[3], self.alpha or 1}
    end



    
    -- Define a cor da borda do box
    love.graphics.setColor(self.borderColor)
    -- Define a largura da linha para a borda
    love.graphics.setLineWidth(self.borderWidth)
    -- Desenha a borda arredondada do box
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height, self.cornerRadius, self.cornerRadius)
    -- Define a cor do conteúdo interno do box
    love.graphics.setColor(color)
    -- Desenha o conteúdo interno do box
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height, self.cornerRadius, self.cornerRadius)
    -- Define a largura da linha para o conteúdo interno do box
    love.graphics.setLineWidth(1)
    local textWidth = self.font:getWidth(self.text)
    local textHeight = self.font:getHeight()
    local textX = self.x + (self.width - textWidth) / 2
    local textY = self.y + (self.height - textHeight) / 2
    love.graphics.setColor({0, 0, 0})
    love.graphics.setFont(self.font)
    love.graphics.print(self.text, textX, textY)
end

return Button
