

local View2 = View:new()
View2.__index = View2

function View2:new(o)
    local self = setmetatable(View:new("view2"), self)
    self.load(self)
    return self
end

function View2:load() -- inicializando variaveis
    self.box = self:add(10, 10, 50, 50)
    self:tween({
        target = self.box,
        options = {
            loop = true, -- animação em loop infinito
            easingMode = Easing.inOutQuad
        },
        tweens = {{
            options = {
                x = 1280 - 50
            },
            duration = 2
        }, {
            options = {
                y = 720 - 50,
                width = 20
            },
            duration = 2
        }, {
            options = {
                x = 0,
                width = 50
            },
            duration = 2
        }, {
            options = {
                y = 0
            },
            duration = 2
        }}
    })
end

return View2
