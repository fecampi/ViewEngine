view = require("ViewController")

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
view.start("view1")
view.print("Colocar a view1 em start")

view.start("view2")
view.print("Colocar a view2 em start")

view.pause("view3")
view.print("Colocar a view3 em pause")

view.resume("view4")
view.print("Colocar a view3 em resume")

view.sleep("view5")
view.print("Colocar a view5 em sleep")

view.wake("view6")
view.print("Colocar a view6 em wake")

view.stop("view7")
view.print("Colocar a view7 em stop")
