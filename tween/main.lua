local Tween = require "Tween"

function love.load()
    x = 100
    y = 100
    width = 50
    height = 50

    -- cria a animação do quadrado
    tween1 = Tween:new(2, {
        x = x
    }, {
        x = 300
    }, Tween.inOutQuad)
    tween2 = Tween:new(2, {
        x = 300
    }, {
        x = 100
    }, Tween.inOutQuad)
    tween = tween1
end

function love.update(dt)
    tween:update(dt)
    print(tween.state)
    if tween.state == "stopped" then
        tween = tween2
    end
    print(tween.clock)
    x = tween.subject.x
end

function love.draw()
    love.graphics.rectangle("fill", x, y, width, height)
end
