local View2 = View:new()
View2.__index = View2

function View2:new(o)
    local self = setmetatable(View:new("view2"), self)
    self.create(self)
    return self
end

function View2:create()
    self.box = self:addBox(10, 10, 50, 50)
    self.button = self:addButton(10, 10, 200, 50, "teste de botão")
    self.buttonIcon = self:addButtonIcon(100, 100, 50)
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

return View2
