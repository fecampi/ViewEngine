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
        alpha = 1
    },
    buttonSucess = {
        x = 200,
        y = 200,
        paddingLeft = 40,
        paddingRight = 10,
        paddingTop = 5,
        paddingBottom = 5,
        variant = "success",
        text = "Sucess",
        alpha = 1
    }
}

function View2:new(o)
    local self = setmetatable(View:new("view2"), self)
    self.create(self)
    return self
end

function View2:create()
    self.buttonPrimary = self:addButton(styled.buttonPrimary)
    self.buttonPrimary.onSelected = function()
        print("Clicou no Button Primary")
    end
    self.buttonSuccess = self:addButton(styled.buttonSucess)
    self.buttonSuccess.onSelected = function()
        print("Clicou no Button Sucess!")
    end
end

return View2

