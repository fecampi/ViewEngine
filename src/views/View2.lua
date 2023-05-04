local View2 = View:new()
View2.__index = View2

function View2:new(o)
    local self = setmetatable(View:new("view2"), self)
    self.create(self)
    self.isKeypressed = true
    return self
end


function View2:create()

    -- buttonPrimary
    self.buttonPrimary = self:addButton{
        x = 100,
        y = 200,
        paddingLeft = 0,
        paddingRight = 10,
        paddingTop = 5,
        paddingBottom = 5,
        variant = "primary",
        text = "Ligar view3",
        isFocused = true,
        onArrowRight = function()
            self.buttonPrimary.isFocused = false
            self.buttonDanger.isFocused = true
            print("Com focus em buttonSucces e tecla direita pressionada")
        end,
        onSelected = function()
            viewController.show("view3")
        end
    }

    -- buttonDanger
    self.buttonDanger = self:addButton{
        x = 200,
        y = 200,
        paddingLeft = 40,
        paddingRight = 10,
        paddingTop = 5,
        paddingBottom = 5,
        text = "Desligar view3",
        variant = "danger",
        onArrowLeft = function()
            self.buttonPrimary.isFocused = true
            self.buttonDanger.isFocused = false
            print("Com focus em Primary e tecla esquerda pressionada")
        end,
        onSelected = function()
            viewController.hide("view3")
        end
    }

end

return View2

