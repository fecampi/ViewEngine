local Box = {}
function Box:new(x, y, width, height)
    local o = o or {}
    setmetatable(o, self)
    self.__index = self
    o.tweenAnimation = undefined
    o.rectProps = {
        x = x,
        y = y,
        width = width,
        height = height
    }
    return o
end

function Box:createTweenAnimation(props)
    local rectTween = {
        subject = self.rectProps,
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
    love.graphics.rectangle("fill", self.rectProps.x, self.rectProps.y, self.rectProps.width, self.rectProps.height)
end

return Box