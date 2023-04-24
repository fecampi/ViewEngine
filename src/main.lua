viewController = require("lib/controllers/ViewController")
TweenAnimation = require("lib/animation/TweenAnimation")
Tween = require("lib/animation/Tween")
Easing = require("lib/animation/Easing")
Box = require("lib/components/Box")
Video = require("lib/components/Video")
Button = require("lib/components/Button")
GraphicServices = require("lib/services/GraphicServices")
View = require("lib/components/View")
graphics = GraphicServices:new()
Styles = require("lib/styles/index")



viewController.add("view1", "views/View1")
viewController.add("view2", "views/View2")
viewController.add("view3", "views/View3")

viewController.show("view1")
viewController.show("view2")
viewController.show("view3")

viewController.sendToBack("view2")

-- Variável para armazenar se o comando foi pressionado uma vez
pressed1 = false
pressed2 = false
pressed3 = false
pressedP = false
pressedM = false

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
    viewController.keypressed(key)
end

