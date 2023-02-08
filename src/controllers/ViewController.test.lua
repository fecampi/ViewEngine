view = require("ViewController")

-- ADD/REMOVER
--[[
Adiciona uma nova view ao jogo com o nome de chave especificado. 
]] --
view.add("view1")
view.add("view2")
view.add("view3")
view.add("view4")
view.add("view5")
view.add("view6")
view.add("view7")
view.add("view8")
view.add("view9")
view.print("Adicionar valores")
-- remove a view
view.remove("view9")
view.print("Deletar a view9")

-- ViewPositionController
--mova uma posição para atrás
view.moveDown("view3")
view.print("mover a view3 um passo para atrás")

--mova uma posição para frente
view.moveUp("view5")
view.print("mover a view5 um passo para frente")

--troque as posições
view.swapPosition("view2", "view1")
view.print("Intercambiar as posições das views view2 e view1")

view.bringToTop("view3")
view.print("Trazer a view3 para frente de todas")

---Colocar a view3 atrás de todos
view.sendToBack("view3")
view.print("Colocar a view3 atrás de todos")

---Colocar a view A na Atrás da view A
view.moveBelow("view1", "view5")
view.print("Colocar a view1 na Atrás da view5")

-- StateController
--[[
Os eventos start, stop, pause, resume, wake e sleep são eventos de ciclo de vida das views.
Eles são acionados quando uma view é iniciada, interrompida, pausada, retomada, acordada ou colocada para dormir.
]] --


--[[
start: é acionado quando uma view é iniciada. 
Isso pode ser usado para configurar a view, 
carregar recursos, criar objetos e definir valores iniciais.
]] --
view.start("view1")
view.print("Colocar a view1 em start")

--[[
pause: é acionado quando uma view é pausada.
Isso pode ser usado para pausar animações,
som e outras atividades que devem ser interrompidas enquanto a view estiver pausada.
]] --
view.pause("view3")
view.print("Colocar a view3 em pause")

--[[
resume: é acionado quando uma view é retomada depois de ter sido pausada. 
Isso pode ser usado para continuar animações, 
som e outras atividades interrompidas.
]] --
view.resume("view4")
view.print("Colocar a view3 em resume")

--[[
sleep: é acionado quando uma view é colocada para dormir antes de ser pausada ou interrompida.
 Isso pode ser usado para salvar dados, 
limpar recursos e preparar a view para ser pausada ou interrompida.
]] --
view.sleep("view5")
view.print("Colocar a view5 em sleep")

--[[
wake: é acionado quando uma view é acordada após ter sido pausada ou interrompida.
 Isso pode ser usado para reconfigurar a view, 
recarregar recursos e retomar atividades interrompida
]] --
view.wake("view6")
view.print("Colocar a view6 em wake")

--[[
stop: é acionado quando uma view é interrompida.
 Isso pode ser usado para limpar recursos, remover objetos e salvar dados.
]] --
view.stop("view7")
view.print("Colocar a view7 em stop")

-- VisibilityController
--[[
show: é acionado quando é necessario exibir uma view
 Isso pode ser usado para limpar recursos, remover objetos e salvar dados.
]] --
view.show("view8")
view.print("Colocar a view7 em show")


--[[
hide: é acionado quando é necessario esconder uma view
 Isso pode ser usado para limpar recursos, remover objetos e salvar dados.
]] --
view.hide("view8")
view.print("Colocar a view8 em hide")