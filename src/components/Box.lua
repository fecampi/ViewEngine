local Box = {}
function Box:new(x, y, width, height)
    local o = {
        x = x,
        y = y,
        width = width,
        height = height,
        borderWidth = 5,
        borderColor = {0, 1, 0}, -- verde
        boxColor = {0, 0, 1}, -- azul
        tweenAnimation = undefined
    }
    setmetatable(o, self)
    self.__index = self
    return o
end

function Box:createTweenAnimation(props)
    local rectTween = {
        subject = self,
        options = props.options,
        tweens = props.tweens
    }
    self.tweenAnimation = TweenAnimation:new(rectTween)
end

function Box:update(dt)
    if self.tweenAnimation == undefined then
        return
    end
    self.tweenAnimation:update(dt)
end

function Box:draw()
    graphics:drawBox(self.x, self.y, self.width, self.height, self.boxColor, self.borderColor, self.borderWidth)
end

return Box
