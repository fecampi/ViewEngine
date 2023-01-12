view = {}
views = {{
    name = "view1"
}, {
    name = "view2"
}, {
    name = "view3"
}, {
    name = "view4"
}, {
    name = "view5"
}}

function view.moveDown(name)
    for i, v in ipairs(views) do
        if v.name == name then
            if i < #views then
                local temp = views[i]
                views[i] = views[i + 1]
                views[i + 1] = temp
            end
            break
        end
    end
end

function view.moveUp(name)
    for i, v in ipairs(views) do
        if v.name == name then
            if i > 1 then
                local temp = views[i]
                views[i] = views[i - 1]
                views[i - 1] = temp
            end
            break
        end
    end
end

function view.swapPosition(name1, name2)
    local i1, i2
    for i, v in ipairs(views) do
        if v.name == name1 then
            i1 = i
        elseif v.name == name2 then
            i2 = i
        end
        if i1 and i2 then
            local temp = views[i1]
            views[i1] = views[i2]
            views[i2] = temp
            break
        end
    end
end

function view.bringToTop(name)
    for i, v in ipairs(views) do
        if v.name == name then
            if i > 1 then
                table.remove(views, i)
                table.insert(views, 1, v)
            end
            break
        end
    end
end

function view.moveAbove(name1, name2)
    local i1, i2
    for i, v in ipairs(views) do
        if v.name == name1 then
            i1 = i
        elseif v.name == name2 then
            i2 = i
        end
        if i1 and i2 then
            if i1 > 1 and i1 < #views then
                table.remove(views, i1)
                table.insert(views, i2 + 1, v)
            end
            break
        end
    end
end

function view.moveBelow(name1, name2)
    local i1, i2, v
    for i, view in ipairs(views) do
        if view.name == name1 then
            v = view
            i1 = i
        elseif view.name == name2 then
            i2 = i
        end
    end
    if i1 and i2 and i1 < i2 then
        table.remove(views, i1)
        table.insert(views, i2, v)
    end
end

function view.sendToBack(name)
    for i, v in ipairs(views) do
        if v.name == name then
            if i < #views then
                table.remove(views, i)
                table.insert(views, v)
            end
            break
        end
    end
end

function view.print(msg)
    print()
    print("------")
    print(msg)
    print()
    for i, v in ipairs(views) do
        print(v.name)
    end
    print("------")

end

return view



