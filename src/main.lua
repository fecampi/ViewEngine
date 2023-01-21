view = require("controllers/ViewController")
MenuView = require("views/MenuView")
GameView = require("views/GameView")
CreditView = require("views/CreditView")

gameVieww = GameView:new()
view.add("menuView", MenuView)
view.add("gameView", GameView)
view.add("creditView", CreditView)

-- Variável para armazenar se o comando foi pressionado uma vez
pressed1 = false
pressed2 = false
pressed3 = false

function love.load()
    view.load()
end

function love.update(dt)
    view.update(dt)
end

function love.draw()
    view.draw()
end


function love.keypressed(key)
    if key == "1" then
        if pressed1 then
            -- Faz algo se o comando for pressionado pela segunda vez
            view.stop("menuView")
            pressed1 = false
        else
            -- Faz algo se o comando for pressionado pela primeira vez
            view.start("menuView")
            pressed1 = true
        end
    end
    if key == "2" then
        if pressed2 then
            -- Faz algo se o comando for pressionado pela segunda vez
            view.stop("gameView")
            pressed2 = false
        else
            -- Faz algo se o comando for pressionado pela primeira vez
            view.start("gameView")
            pressed2 = true
        end
    end
    if key == "3" then
        if pressed3 then
            -- Faz algo se o comando for pressionado pela segunda vez
            view.stop("creditView")
            pressed3 = false
        else
            -- Faz algo se o comando for pressionado pela primeira vez
            view.start("creditView")
            pressed3 = true
        end
    end
end

