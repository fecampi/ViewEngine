view = require("ViewController")

view.print("inicio")

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