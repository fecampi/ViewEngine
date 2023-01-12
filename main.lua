view = {}
views = {}

-- add: Adicionar uma nova view
view.add = function(view)
    local object = {
        state = "stop",
        grids = {}
    }
    table.insert(views,object)
end

-- getAll: obter todas as views
view.getAll = function()
    for view, object in pairs(views) do
        print("view: " .. view .. " - state: " .. object.state)
    end
end

-- start: Carregar as cena 
view.start = function(view)
    if views[view] then
        views[view]["state"] = "start"
    else
        local object = {
            id = view,
            state = "start"
        }
        views[view] = object
    end
end

view.pause = function(view)
    if views[view] then
        views[view]["state"] = "pause"
    end
end

view.sleep = function(view)
    if views[view] then
        views[view]["state"] = "sleep"
    end
end


-- start: Carregar as cena 
view.start = function(view)
    if views[view] then
        views[view]["state"] = "start"
    else
        view.add(view)
    end
end

view.pause = function(view)
    if views[view] then
        views[view]["state"] = "pause"
    end
end

view.sleep = function(view)
    if views[view] then
        views[view]["state"] = "sleep"
    end
end

-- moves: alternar ordens das views
-- Move viewA down one position in the views table
view.moveDown = function(viewA)
    for i, v in ipairs(views) do
        if v == viewA then
            if i < #views then
                views[i], views[i + 1] = views[i + 1], views[i]
            end
            break
        end
    end
end

-- Move viewA up one position in the views table
view.moveUp = function (viewA)
    for i, v in ipairs(views) do
        print("oi")
        if v == viewA then
            print("oi")
            if i > 1 then
                views[i], views[i - 1] = views[i - 1], views[i]
            end
            break
        end
    end
end

-- Move viewA above viewB in the views table
view.moveAbove  = function(viewA, viewB)
    local a_i, b_i
    for i, v in ipairs(views) do
        if v == viewA then
            a_i = i
        elseif v == viewB then
            b_i = i
        end
    end
    if a_i and b_i and a_i < b_i then
        table.remove(views, a_i)
        table.insert(views, b_i, viewA)
    end
end

-- Move viewA below viewB in the views table
view.moveBelow  = function (viewA, viewB)
    local a_i, b_i
    for i, v in ipairs(views) do
        if v == viewA then
            a_i = i
        elseif v == viewB then
            b_i = i
        end
    end
    if a_i and b_i and a_i > b_i then
        table.remove(views, a_i)
        table.insert(views, b_i + 1, viewA)
    end
end



---------------

-- add: Adicionar uma nova view                                 
view.add("view1")
view.start("view7")
view.add("view2")
view.add("view3")
view.pause("view3")
view.add("view4")
view.sleep("view4")
view.getAll()
view.moveDown("view1")
print("--")
-- getAll: obter todas as views
view.getAll()

