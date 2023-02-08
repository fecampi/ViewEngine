view = {}
views = {}

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

function view.add(name, path)
    if not path then
        table.insert(views, {
            name = name,
            state = "stop",
            visibility = "hide",
            object = {}
        })
        return
    end
    path = path or {}
    table.insert(views, {
        name = name,
        state = "stop",
        visibility = "hide",
        object = require(path):new()
    })
end

function view.remove(name)
    for i, v in ipairs(views) do
        if v.name == name then
            table.remove(views, i)
            break
        end
    end
end

-- Visibility check
function view.hide(name)
    for i, v in ipairs(views) do
        if v.name == name then
            if v.object.onHide then
                v.object.onHide()
            end
            v.visibility = "hide"
            break
        end
    end
end

function view.show(name)
    for i, v in ipairs(views) do
        if v.name == name then
            if v.object.onShow then
                v.object.onShow()
            end
            v.visibility = "show"
            -- elseif v.state == "start" then
            --     v.state = "stop"
        end
    end
end

-- States
function view.start(name)
    for i, v in ipairs(views) do
        if v.name == name then
            v.state = "start"
            break
        end
    end
end

function view.pause(name)
    for i, v in ipairs(views) do
        if v.name == name then
            v.state = "pause"
            break
        end
    end
end

function view.resume(name)
    for i, v in ipairs(views) do
        if v.name == name then
            v.state = "resume"
            break
        end
    end
end

function view.sleep(name)
    for i, v in ipairs(views) do
        if v.name == name then
            v.state = "sleep"
            break
        end
    end
end

function view.wake(name)
    for i, v in ipairs(views) do
        if v.name == name then
            v.state = "wake"
            break
        end
    end
end

function view.stop(name)
    for i, v in ipairs(views) do
        if v.name == name then
            v.state = "stop"
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
        print("name: " .. v.name .. " - Estado: " .. v.state .. " - Visibility: " .. v.visibility)
    end
    print("------")

end

function view.draw()
    for currentView in pairs(views) do
        if views[currentView].visibility == "show" then
            views[currentView].object.draw(views[currentView].object)
        end

    end
end

function view.load()
    for currentView in pairs(views) do
        print("loading")
        if views[currentView].state == "start" then
            if views[currentView].object.load then
                print("loading")
                views[currentView].object.load(views[currentView].object)
            end
        end

    end
end

function view.update(dt)
    for currentView in pairs(views) do
        if views[currentView].state == "resume" or views[currentView].state == "start" or views[currentView].visibility ==
            "show" then
            views[currentView].object.update(views[currentView].object, dt)
        end
    end
end

return view

