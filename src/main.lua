view = require("controllers/ViewController")
view.add("view1", "views/View1")
view.add("view2", "views/View2")
view.add("view3", "views/View3")

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
            view.stop("view1")
            pressed1 = false
        else
            -- Faz algo se o comando for pressionado pela primeira vez
            view.start("view1")
            pressed1 = true
        end
    end
    if key == "2" then
        if pressed2 then
            -- Faz algo se o comando for pressionado pela segunda vez
            view.stop("view2")
            pressed2 = false
        else
            -- Faz algo se o comando for pressionado pela primeira vez
            view.start("view2")
            pressed2 = true
        end
    end
    if key == "3" then
        if pressed3 then
            -- Faz algo se o comando for pressionado pela segunda vez
            view.stop("view3")
            pressed3 = false
        else
            -- Faz algo se o comando for pressionado pela primeira vez
            view.start("view3")
            pressed3 = true
        end
    end

    if key == "p" then
        if pressed3 then
            -- Faz algo se o comando for pressionado pela segunda vez
            view.resume("view1")
            pressed3 = false
        else
            -- Faz algo se o comando for pressionado pela primeira vez
            view.pause("view1")
            pressed3 = true
        end
    end

end

