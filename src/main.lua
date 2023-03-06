view = require("controllers/ViewController")
TweenAnimation = require("animation/TweenAnimation")
Tween = require("animation/Tween")
Easing = require("animation/Easing")
Box = require("components/Box")
GraphicServices = require("services/GraphicServices")
graphics = GraphicServices:new()

view.add("view1", "views/View1")
view.add("view2", "views/View2")
view.add("view3", "views/View3")
view.show("view1")
view.show("view2")
view.show("view3")
view.bringToTop("view2")
view.sendToBack("view3")

-- Variável para armazenar se o comando foi pressionado uma vez
pressed1 = false
pressed2 = false
pressed3 = false
pressedP = false
pressedM = false

function love.load()
    love.window.setMode(1280, 720)
    love.window.setTitle("View Engine")
    view.load()
end

function love.update(dt)
    view.update(dt)
end

function love.draw()
    view.draw()
    love.graphics.print("FPS: " .. tostring(love.timer.getFPS()), 10, 10)
end

function love.keypressed(key)
    if key == "1" then
        if pressed1 then
            -- Faz algo se o comando for pressionado pela segunda vez
            view.hide("view1")
            pressed1 = false
        else
            -- Faz algo se o comando for pressionado pela primeira vez
            view.show("view1")
            pressed1 = true
        end
    end
    if key == "2" then
        if pressed2 then
            -- Faz algo se o comando for pressionado pela segunda vez
            view.hide("view2")
            pressed2 = false
        else
            -- Faz algo se o comando for pressionado pela primeira vez
            view.show("view2")
            pressed2 = true
        end
    end
    if key == "3" then
        if pressed3 then
            -- Faz algo se o comando for pressionado pela segunda vez
            view.hide("view3")
            pressed3 = false
        else
            -- Faz algo se o comando for pressionado pela primeira vez
            view.show("view3")
            pressed3 = true
        end
    end

    if key == "p" then
        if pressedP then
            -- Faz algo se o comando for pressionado pela segunda vez
            view.resume("view1")
            pressedP = false
        else
            -- Faz algo se o comando for pressionado pela primeira vez
            view.pause("view1")
            pressedP = true
        end
    end

    if key == "m" then
        if pressedM then
            -- Faz algo se o comando for pressionado pela segunda vez
            view.bringToTop("view3")
            print("sendTop")
            pressedM = false
        else
            -- Faz algo se o comando for pressionado pela primeira vez
            view.sendToBack("view3")
            print("sendBack")
            pressedM = true
        end
    end

end

