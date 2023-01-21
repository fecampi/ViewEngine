local view = {}

function view.update()
    -- Código para atualizar a cena do menu
end
function view.draw()
    love.graphics.print("Créditos", 100, 300)
end

function view.onStart()
    print("onStart Credit")
end
function view.onStop()
    print("onStop Credit")
end

return view
