local TweenAnimation = {}
TweenAnimation.__index = TweenAnimation

function TweenAnimation:new(rectTween)
    local subject = rectTween.subject
    local options = rectTween.options
    local tweens = rectTween.tweens

    local obj = {
        subject = subject,
        options = options,
        tweens = tweens,
        tweenIndex = 1,
        currentTween = Tween:new(tweens[1].duration, subject, tweens[1].options, options.easingMode),
        loop = options.loop or false
    }

    setmetatable(obj, TweenAnimation)
    return obj
end

function TweenAnimation:update(dt)
    self.currentTween:update(dt)

    if self.currentTween.state == "stopped" and self.loop then
        self.tweenIndex = self.tweenIndex + 1
        if self.tweenIndex > #self.tweens then
            self.tweenIndex = 1
        end
        self.currentTween = Tween:new(self.tweens[self.tweenIndex].duration, self.subject,
            self.tweens[self.tweenIndex].options, self.options.easingMode)
    end
end

return TweenAnimation