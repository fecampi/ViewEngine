local View2 = {}


-- Esqueminha para o lua aceitar a classe(pseudo-construtor)
function View2:new(o)
    local o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.load(self)
    return o
end

function View2:load() -- inicializando variaveis
    self.box = Box:new(10, 10, 50, 50)
    props = {
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
    }
    self.box:createTweenAnimation(props)
end

function View2:update(dt)
    self.box:update(dt)
end

function View2:draw()
    self.box:draw()
end

return View2
