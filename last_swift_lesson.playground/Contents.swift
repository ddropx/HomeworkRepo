import Foundation

// Создайте протоколы Jumper, Swimmer, Runner. Добавьте каждому протоколу несколько свойств, например, скорость бега, высота прыжка и тд, причем одни свойства должны быть изменяемыми (get set), а другие нет (get), так же добавьте методы, какие именнно придумайте сами

protocol Jumper {
    var jumpHeight: Int {get set}
    func jumpToTheSand()
}

protocol Swimmer {
    var swimmingSpeed: Int {get}
    func swimInThePool()
}

protocol Runner {
    var runningAcceleration: Int {get}
    func runOnTheStreet()
}

//  Создайте несколько классов людей и животных и подпишите их на соответствующие протоколы, например плавец, кенгуру и тд

class Afroamerican: Jumper, Runner {
    var runningAcceleration: Int = 30 // kilometers per hour
    var jumpHeight: Int = 120 // Centimeters in height
    func jumpToTheSand() {
        return print("")
    }
    func runOnTheStreet() {
        return print("")
    }
}

class Fish: Swimmer {
    var swimmingSpeed: Int {
        return 6 // kilometers per hour
    }
    func swimInThePool() {
        print("")
    }
}

class Cheetah: Runner {
    var runningAcceleration: Int {
        return 120 // kilometers per hour
    }
    func runOnTheStreet() {
        print("")
    }
}

// Положите все объекты классов в один массив и пройдитесь по нему, попутно выводите в консоль свойства и методы соответствующего протокола

var array: [Any] = [Afroamerican(), Fish(), Cheetah()]

func printArray() {
    array.forEach { object in
        
        if let jumper = object as? Jumper {
            print("If i could speak i would say that my jump height is \(jumper.jumpHeight)")
        }
        
        if let swimmer = object as? Swimmer {
            print("If i could speak i would say that my swimming speed is  \(swimmer.swimmingSpeed)")
        }
        
        if let runner = object as? Runner {
            print("If i could speak i would say that my running  acceleration is \(runner.runningAcceleration)")
        }
    }
}
// Добавьте в массив такой объект класса, который подписан сразу на три протокола и посмотрите что он будет делать в цикле

class SuperAfroamerican: Jumper, Swimmer, Runner {
    var jumpHeight: Int = 190
    func jumpToTheSand() { }
    
    var swimmingSpeed: Int = 30
    func swimInThePool() { }
    
    var runningAcceleration: Int = 150
    func runOnTheStreet() { }
}

array.append(SuperAfroamerican())

printArray()
