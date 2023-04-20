viewController = require("lib/controllers/ViewController")
TweenAnimation = require("lib/animation/TweenAnimation")
Tween = require("lib/animation/Tween")
Easing = require("lib/animation/Easing")
Box = require("lib/components/Box")
Video = require("lib/components/Video")
Button = require("lib/components/Button")
ButtonIcon = require("lib/components/ButtonIcon")
GraphicServices = require("lib/services/GraphicServices")
View = require("lib/components/View")
graphics = GraphicServices:new()


viewController.add("view2", "views/View2")
viewController.add("view1", "views/View1")

viewController.show("view2")
viewController.show("view1")

viewController.sendToBack("view2")

-- -- Variável para armazenar se o comando foi pressionado uma vez
-- pressed1 = false
-- pressed2 = false
-- pressed3 = false
-- pressedP = false
-- pressedM = false

function love.load()
    love.window.setMode(1280, 720)
    love.window.setTitle("View Engine")
    viewController.load()
    viewController.start()
end

function love.update(dt)
    viewController.update(dt)
end

function love.draw()
    viewController.draw()
    love.graphics.setColor({0,0,0})
    love.graphics.print("FPS: " .. tostring(love.timer.getFPS()), 10, 10)
end

function love.keypressed(key)
    if key == "1" then
        if pressed1 then
            -- Faz algo se o comando for pressionado pela segunda vez
            viewController.hide("view1")
            pressed1 = false
        else
            -- Faz algo se o comando for pressionado pela primeira vez
            viewController.show("view1")
            pressed1 = true
        end
    end
    if key == "2" then
        if pressed2 then
            -- Faz algo se o comando for pressionado pela segunda vez
            viewController.hide("view2")
            pressed2 = false
        else
            -- Faz algo se o comando for pressionado pela primeira vez
            viewController.show("view2")
            pressed2 = true
        end
    end
    if key == "3" then
        if pressed3 then
            -- Faz algo se o comando for pressionado pela segunda vez
            viewController.hide("view1")
            pressed3 = false
        else
            -- Faz algo se o comando for pressionado pela primeira vez
            viewController.show("view1")
            pressed3 = true
        end
    end

    if key == "p" then
        if pressedP then
            -- Faz algo se o comando for pressionado pela segunda vez
            viewController.resume("view1")
            pressedP = false
        else
            -- Faz algo se o comando for pressionado pela primeira vez
            viewController.pause("view1")
            pressedP = true
        end
    end

    if key == "m" then
        if pressedM then
            -- Faz algo se o comando for pressionado pela segunda vez
            viewController.bringToTop("view1")
            print("sendTop")
            pressedM = false
        else
            -- Faz algo se o comando for pressionado pela primeira vez
            viewController.sendToBack("view1")
            print("sendBack")
            pressedM = true
        end
    end

end

