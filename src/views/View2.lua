local View2 = View:new()
View2.__index = View2

local styled = {
    buttonPrimary = {
        x = 100,
        y = 200,
        paddingLeft = 10,
        paddingRight = 10,
        paddingTop = 5,
        paddingBottom = 5,
        variant = "primary",
        text = "Primary",
    },
    buttonDanger = {
        x = 200,
        y = 200,
        paddingLeft = 40,
        paddingRight = 10,
        paddingTop = 5,
        paddingBottom = 5,
        variant = "danger",
        text = "Danger",
    }
}

function View2:new(o)
    local self = setmetatable(View:new("view2"), self)
    self.create(self)
    self.isKeypressed = true
    return self
end

function View2:create()
    self.buttonPrimary = self:addButton(styled.buttonPrimary)
    self.buttonPrimary.isFocused = true

    self.buttonPrimary.onArrowRight = function()
        self.buttonPrimary.isFocused = false
        self.buttonDanger.isFocused = true
        print("Com focus em buttonSucces e tecla direita pressionada")
    end
    self.buttonDanger = self:addButton(styled.buttonDanger)
    self.buttonDanger.onArrowLeft = function()
        self.buttonPrimary.isFocused = true
        self.buttonDanger.isFocused = false
        print("Com focus em Primary e tecla esquerda pressionada")
    end




    self.buttonPrimary.onSelected = function()
        viewController.show("view3")
    end

    self.buttonDanger.onSelected = function()
        viewController.hide("view3")
    end

end

return View2

