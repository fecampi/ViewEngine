local View1 = View:new()
View1.__index = View1

function View1:new(o)
    local self = setmetatable(View:new("view3"), self)
    self.create(self)
    return self
end

function View1:create() 
    print("oi")
    self:addVideo("views/video720p.ogv")
end

return View1
