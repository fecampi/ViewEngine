local View3 = View:new()
View3.__index = View3

function View3:new(o)
    local self = setmetatable(View:new("view3"), self)
    self.create(self)
    return self
end

function View3:create()
    self.box = self:addBox({
        x = 10,
        y = 10,
        width = 50,
        height = 50,
        cornerRadius = 60,
        borderWidth = 5,
        borderColor = {0, 1, 0}, -- verde
        boxColor = {0, 0, 1}, -- azul
        alpha = 0.5
    })
    self.box.width = 100
    self:tween({
        target = self.box,
        options = {
            loop = true, -- animação em loop infinito
            easingMode = Easing.inOutQuad
        },
        tweens = {{
            options = {
                x = 1280 - 50,
                alpha = 1
            },
            duration = 2
        }, {
            options = {
                y = 720 - 50,
                width = 20,
                alpha = 0
            },
            duration = 2
        }, {
            options = {
                x = 0,
                width = 50,
                alpha = 1
            },
            duration = 2
        }, {
            options = {
                y = 0,
                alpha = 0
            },
            duration = 2
        }}
    })
end

return View3
