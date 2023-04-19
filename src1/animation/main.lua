TweenAnimation = require "TweenAnimation"
Tween= require "Tween"
Easing = require "Easing"

function love.load()
    love.window.setMode(1280, 720)
    rect = {
        x = 0,
        y = 0,
        width = 50,
        height = 50
    }
    rectTween = {
        subject = rect,
        options = {
            loop = true, -- animação em loop infinito
            easingMode = Easing.inOutQuad
        },
        tweens = {{
            options = {
                x = 1280 - 50,
            },
            duration = 2
        }, {
            options = {
                y = 720 - 50,
                width = 20,
            },
            duration = 2
        }, {
            options = {
                x = 0,
                width = 50
            },
            duration = 2
        }, {
            options = {
                y = 0
            },
            duration = 2
        }}
    }

    tweenAnimation = TweenAnimation:new(rectTween)
end

function love.update(dt)
    tweenAnimation:update(dt)
end

function love.draw()
    love.graphics.rectangle("fill", rect.x, rect.y, rect.width, rect.height)
end
