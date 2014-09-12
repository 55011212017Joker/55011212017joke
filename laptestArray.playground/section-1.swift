// Playground - noun: a place where people can play


class Arraytest{
    
    var fac = [Int]()
    //let num2:Int
    var sum = 1
    
    init (fac:[Int]){
        
        self.fac = fac
        //self.num2 = num2
       // sum = sum*fac
    }
    
    func returnprocess(i:Int)->Int{
        return sum*i
    }
    
    
    func process()->Int{
        for(var loop = 0;loop < fac.count;loop++){
            
            for  (var i = 1;i < fac[loop];i++){
                sum += returnprocess(i)
                println("loop\(i) = \(sum)")
            }
            sum=1
            println("--------------------------------")
        }
        
        return sum
    }
    
}

var value = Arraytest (fac:[10,20])
println(value.process())
