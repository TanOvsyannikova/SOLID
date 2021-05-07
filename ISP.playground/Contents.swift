import UIKit

//this protocol can't be used for penguins -> Segregate
//protocol Birds {
//    func fly()
//    func swim()
//}

protocol IsFlying {
    func fly()
}

protocol IsSwimming {
    func swim()
}

class Duck: IsFlying, IsSwimming {
    func fly() {
        print("I love flying")
    }
    
    func swim() {
        print("I love swimming")
    }
}

let duck1 = Duck()
duck1.fly()
duck1.swim()

class Penguin: IsSwimming {
    func swim() {
        print("I love swimming")
    }
}

let someBird = Penguin()
someBird.swim()













