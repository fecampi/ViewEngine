--[[
The Rect class is a graphics object that represents a rectangular shape. 
It is based on the EaselJS library's Graphics.Rect class,
 which can be found at https://createjs.com/docs/easeljs/classes/Graphics.Rect.html.
]]

Box = {}
Box.__index = Box

function Box:new(options)
    local self = setmetatable({}, Box)
    self.x = options and options.x or 0
    self.y = options and options.y or 0
    self.width = options and options.width or 0
    self.height = options and options.height or 0
    self.borderWidth = options and options.borderWidth  or 0
    self.borderColor = options and options.borderColor or 0
    self.color = options and options.color or {0, 0, 1}
    self.alpha = options and options.alpha or 0
    self.tweenAnimation = undefined
    self.cornerRadius =  options and options.cornerRadius or 10
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
    graphics:drawRect({  
        x = self.x,
        y = self.y,
        cornerRadius = self.cornerRadius,
        width = self.width,
        height = self.height,
        borderColor = self.borderColor,
        borderWidth = self.borderWidth,
        color = self.color
    })    
end

return Box
