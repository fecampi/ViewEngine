--[[
The Rect class is a graphics object that represents a rectangular shape. 
It is based on the EaselJS library's Graphics.Rect class,
 which can be found at https://createjs.com/docs/easeljs/classes/Graphics.Rect.html.
]]

Box = {}
Box.__index = Box

function Box:new(x, y, width, height)
    local self = setmetatable({}, Box)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.borderWidth = 5
    self.borderColor = {0, 1, 0} -- verde
    self.boxColor = {0, 0, 1} -- azul
    self.alpha = 0.5
    self.tweenAnimation = undefined
    return self
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
    local color = {self.boxColor[1], self.boxColor[2], self.boxColor[3], self.alpha or 1}
    graphics:drawRect(self.x, self.y, self.width, self.height, color, self.borderColor, self.borderWidth)
end

return Box
