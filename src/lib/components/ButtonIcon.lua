ButtonIcon = {}
ButtonIcon.__index = ButtonIcon

function ButtonIcon:new(x, y, size)
    local self = setmetatable({}, ButtonIcon)
    self.x = x
    self.y = y
    self.size = size
    self.color = {1, 1, 1} -- branco
    self.hoverColor = {0.8, 0.8, 0.8} -- cinza claro
    self.isSelected = false
    return self
end

function ButtonIcon:update(dt)
    -- verificar se o mouse está sobre o triângulo
    local mx, my = love.mouse.getPosition()
    local isHover = mx >= self.x and mx <= self.x + self.size and my >= self.y and my <= self.y + self.size
    if isHover then
        -- muda a cor do triângulo para a cor de destaque
        self.color = self.hoverColor
        -- verifica se o botão do mouse foi pressionado
        if love.mouse.isDown(1) then
            -- imprime a mensagem e define o triângulo como selecionado
            print("Clicou no triângulo!")
            self.isSelected = true
        end
    else
        -- retorna a cor do triângulo para a cor padrão
        self.color = {1, 1, 1}
    end
end

function ButtonIcon:draw()
    -- Triângulo apontando para a direita
    love.graphics.setColor(self.color)
    love.graphics
        .polygon("fill", self.x, self.y, self.x, self.y + self.size, self.x + self.size, self.y + self.size / 2)

end

return ButtonIcon
