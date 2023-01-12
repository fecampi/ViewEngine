local rectX = 0
local rectSpeed = 100
local finalPosition = 500

view1 = {
    load = function(width, height)
        width = 100
        height = 50
    end,

    update = function(dt)
        if rectX < finalPosition then
            rectX = rectX + (rectSpeed * dt)
        end

    end,

    draw = function()
        love.graphics.rectangle("fill", rectX, 200, width, height)
    end
}

view2 = {
    load = function()
        width = 100
        height = 50
    end,

    update = function(dt)
        if rectX < finalPosition then
            rectX = rectX + (rectSpeed * dt)
        end

    end,

    draw = function()
        love.graphics.rectangle("fill", rectX, 400, width, height)
    end
}

function love.load()
    view1.load()
    view2.load()
end

function love.update(dt)
    view1.update(dt)
    view2.update(dt)

end

function love.draw()
    view1.draw()
    view2.draw()
end
