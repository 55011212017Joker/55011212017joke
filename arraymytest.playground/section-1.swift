var shoppingListExplicit = [String]()
shoppingListExplicit = ["Eggs1unit","Milk"]
//var shoppingListExplicit: [String] = ["Eggs","Milk"]

var shoppingList = ["Eggs","Milk"]
println("The shopping list contains\(shoppingList.count) items.")
//นับ
shoppingList.append("Flour")
shoppingList += ["Baking Power"]
shoppingList += ["Chocolate Spreed","Cheese","Butter"]
//เพิ่มข้อมมูล
var firstItem = shoppingList[1]
shoppingList[0] = "Six eggs"
//เปลี่ยนข้อมูล

// เปลี่ยน var เป็น let จะไม่สามารถเปลี่ยนแปลงค่าได้ Error

//นับจำนวณข้อมูลในarray
let possibleTipsInferred = [0.5, 0.18, 0.20]
let possibleTipExlicit:[Double] = [0.5, 0.18, 0.20]
var numberOhItem = possibleTipsInferred.count

possibleTipsInferred.isEmpty
//ถ้าไม่มีข้อมูลฝน array จะเป็นค่า false

//เพิ่มค่าใน array
shoppingList.insert("pizzaHut", atIndex: 0)
shoppingList

shoppingList.append("Flour5")
shoppingList

shoppingList[1...3] = ["BananaIT","Applestave Job"]
shoppingList

//ลบข้อมูล
let Flour = shoppingList.removeLast()
let Apple = shoppingList.removeAtIndex(2)
shoppingList

shoppingList.removeLast()

var intvalue = [Int]()
    intvalue = [55011212017,55011212167,550112111111]
    
var namevalue = ["Chonlakan","Per","Koo"]


var newID = intvalue[0]+10

intvalue += [55011212028,55011212007]
namevalue += ["FFFF"]


intvalue[0...1] = [0,1]
intvalue[3...4] = [0,0]
intvalue

intvalue.removeAtIndex(2)
intvalue



if (true){
    println("\(namevalue) on sale for \(intvalue) !")
}
    
    

