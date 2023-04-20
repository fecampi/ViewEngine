Video = {}
Video.__index = Video
function Video:new(fileName)
    self.video = love.graphics.newVideo(fileName)
    self.video:play()
    return self
end

function Video:draw()
    --    Desenha o vídeo que está atrás do retângulo
    love.graphics.setColor(1, 1, 1) -- branco
    love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
    love.graphics.draw(self.video, 0, 0)
end

return Video