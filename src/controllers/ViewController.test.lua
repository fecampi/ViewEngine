view = require("ViewController")

--[[
Adiciona uma nova cena ao jogo com o nome de chave especificado. 
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
view.remove("view9")
view.print("Deletar a view9")

-- ViewPositionController

view.moveDown("view3")
view.print("mover a view3 um passo para atrás")

view.moveUp("view5")
view.print("mover a view5 um passo para frente")

view.swapPosition("view2", "view1")
view.print("Intercambiar as posições das cenas view2 e view1")

view.bringToTop("view3")
view.print("Trazer a view3 para frente de todas")

---Colocar a view3 atrás de todos
view.sendToBack("view3")
view.print("Colocar a view3 atrás de todos")

---Colocar a cena A na Atrás da cena A
view.moveBelow("view1", "view5")
view.print("Colocar a view1 na Atrás da view5")

-- StateController
--[[
Os eventos start, stop, pause, resume, wake e sleep no Phaser são eventos de ciclo de vida das cenas.
Eles são acionados quando uma cena é iniciada, interrompida, pausada, retomada, acordada ou colocada para dormir.
]] --

view.start("view1")
view.print("Colocar a view1 em start")

--[[
start: é acionado quando uma cena é iniciada. 
Isso pode ser usado para configurar a cena, 
carregar recursos, criar objetos e definir valores iniciais.
]] --
view.start("view2")
view.print("Colocar a view2 em start")

--[[
pause: é acionado quando uma cena é pausada.
Isso pode ser usado para pausar animações,
som e outras atividades que devem ser interrompidas enquanto a cena estiver pausada.
]] --
view.pause("view3")
view.print("Colocar a view3 em pause")

--[[
resume: é acionado quando uma cena é retomada depois de ter sido pausada. 
Isso pode ser usado para continuar animações, 
som e outras atividades interrompidas.
]] --
view.resume("view4")
view.print("Colocar a view3 em resume")

--[[
sleep: é acionado quando uma cena é colocada para dormir antes de ser pausada ou interrompida.
 Isso pode ser usado para salvar dados, 
limpar recursos e preparar a cena para ser pausada ou interrompida.
]] --
view.sleep("view5")
view.print("Colocar a view5 em sleep")

--[[
wake: é acionado quando uma cena é acordada após ter sido pausada ou interrompida.
 Isso pode ser usado para reconfigurar a cena, 
recarregar recursos e retomar atividades interrompida
]] --
view.wake("view6")
view.print("Colocar a view6 em wake")

--[[
stop: é acionado quando uma cena é interrompida.
 Isso pode ser usado para limpar recursos, remover objetos e salvar dados.
]] --
view.stop("view7")
view.print("Colocar a view7 em stop")
