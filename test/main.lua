function love.load()
    video = love.graphics.newVideo("sample_640x360.ogv")
    video:play()
end

function love.draw()
    love.graphics.draw(video, 0, 0)
end