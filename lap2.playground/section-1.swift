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