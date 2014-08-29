class TipCalculator{
    
    //2
    let total: Double
    let taxPct: Double
    let subtotal: Double
    
    //3
    init(total:Double, taxPct:Double){
        self.total = total
        self.taxPct = taxPct
        subtotal = total / (taxPct + 1)
    }
    //4
    func calcTipWithTipPct(tipPct:Double) ->Double{
        return subtotal * tipPct
    }
    
    //1
    func returnPossibleTips() -> [Int: Double]{
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        let possibleTipExplicit:[Double] = [0.15, 0.18, 0.20]
        
        //2
        var retval = Dictionary<Int, Double>()
        for possibleTip in possibleTipsInferred{
            let intPct = Int(possibleTip*100)
            //3
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retval
    }
}

//
let tipCalc = TipCalculator(total: 33.25, taxPct: 0.06)


let array:Array<Int> = [1,2,3,4]
let dictionary:Dictionary<String,Int> = ["dog":1,"elepphant":2]

var airports:[String:String] = ["TY0":"Tokyo","DUB":"Dublin"]

if (airports.isEmpty) {
    println("The airports dictinary is empty")
}else {
     println("The airports dictinary is not empty ไม่มี")
}


//อัพเดท Dic

airports["LHR"] = "London"
airports["LHR"] = "London Heathow"

if let lue = airports.updateValue("Dublin", forKey: "DUB"){
    println("123ssssssSsssss123")
    
}else{
    println("...123456...")
    
}


/////////////////////////////
class Animal{
let Animalname :String
let weith : Int
var nameAnimal: [String:Int] = ["ช้าง":2000,"ม้า":400,"หมี":800,"ลิง":60,"ยีราฟ":500]



init(Animalname: String,weith:Int){
    self.weith = weith
    self.Animalname = Animalname
    }
    
    
func valueAnimal(Animalname:String) -> Int{
      
    var addname = nameAnimal[Animalname]
       
    return addname!
}
    
    
func changeweith(Animal: String,weith:Int){
    nameAnimal[Animal] = weith
        
    }
    
    
}


let test = Animal(Animalname: "หมี", weith:11)
test.valueAnimal("ช้าง")
test.changeweith("หมี", weith: 123)

println(test.nameAnimal)
