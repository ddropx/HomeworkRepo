import UIKit

// 1. Создайте базовый класс артист с "именем", "фамилией" и методом "выступление". У каждого дочернего класса свой метод "выступление" (актер - играет, клоун - развлекает, танцор - танцует), включающее в себя представление участника, в каком жанре выступление и действие (можно просто вывод строки). Создайте дочерний класс "художник", который не хочет, чтобы его называли вы и всегда ставит другое имя, когда вы пытаетесь его назвать. Положить все экземпляры в один массив и пройдясь по нему вызвать у всех выступление.
print("--Task 1--")

class Artist {
    var firstname: String = ""
    var surname: String = ""
    var fullName: String {
        return firstname + " " + surname
}
    func perfomance() {
        print(fullName)
    }
}

class Dancer: Artist {
    override func perfomance() {
        super.perfomance()
        print("I'm dancer(without balls)")
    }
}

class Singer: Artist {
    override func perfomance() {
        super.perfomance()
        print("I'm singer")
    }
}

class Trudovik: Artist {
    override func perfomance() {
        super.perfomance()
        print("I'm trudovik(swift)")
    }
}

class Painter: Artist {
    override var fullName: String {
        return "No, it's not my name. My name is Mr.Kotlin\nI'm fucking painter"
    }
}

let dancer = Dancer()
dancer.firstname = "Oleg"
dancer.surname = "Bessonov"

let singer = Singer()
singer.firstname = "Vladimir"
singer.surname = "Krizhanovskiy"

let trudovik = Trudovik()
trudovik.firstname = "Maksim"
trudovik.surname = "Kuznetsov"

let painter = Painter()
painter.firstname = "Artem"
painter.surname = "Nekrasov"

for artists in [dancer, singer, trudovik, painter] {
    artists.perfomance()
}

print("")


// 2. Базовый класс - "транспортное средство"; свойства - скорость, вместимость, стоимость одной перевозки (все computed properties). Несколько дочерних классов (самолет, корабль, вертолет, машина, поезд) с переопределенными свойствами (для каждого своя скорость вместимость и стоимость). Создать по одному объекту каждому дочернему классу. У всех есть метод, который что-то расчитывает (скорость, расстояние, количество пассажиров), конкретно сколько уйдет денег и времени, чтобы перевести определенное количество человек из пункта А в пункт В. При перевозке 100 и 1000 человек ответить на следующие вопросы: Как быстро мы сможем это сделать и каким транспортом? Cтоимость всех перевозок и количество? Какой транспорт быстрее справится и какой более выгодный?
print("--Task 2--")

class Vehicle {
    var speed: Int {
        return 0
    }
    var capacity: Int {
        return 0
    }
    var price: Int {
        return 0
    }
    
    func cargoPrice(cargo: Int, distance: Int) {
        let count = cargo / capacity > cargo / capacity ? cargo / capacity + 1 : cargo / capacity
        let time = distance / speed * count
        let costs = price * count
        
        print("Count = \(count)")
        print("Time = \(time)")
        print("Costs = \(costs)")
    }
}

class Helicopter: Vehicle {
    override var speed: Int {
        return 300
    }
    override var capacity: Int {
        return 5000
    }
    override var price: Int {
        return 500
    }
}

class Plane: Vehicle {
    override var speed: Int {
        return 1000
    }
    override var capacity: Int {
        return 15000
    }
    override var price: Int {
        return 5000
    }
}

class PickupTruck: Vehicle {
    override var speed: Int {
        return 100
    }
    override var capacity: Int {
        return 5
    }
    override var price: Int {
        return 50
    }
}

class Train: Vehicle {
    override var speed: Int {
        return 300
    }
    override var capacity: Int {
        return 1500
    }
    override var price: Int {
        return 150
    }
}

for vehicles in [Helicopter(), Plane(), PickupTruck(), Train()] {
    vehicles.cargoPrice(cargo: 12000, distance: 100)
}

print("")
// 3.Пять классов: люди, собаки, жирафы, обезьяны и крокодилы. Сделайте по парочке объектов каждого класса. Создать такой родительский класс, который будет группировать их. Создать массив с пресмыкающимися и посчитать их количество, потом также создать массив и посчитать сколько четвероногих, животных и тд. Массивы не содержат тип Any.
print("--Task 3--")
class Creature {}

class Human: Creature {}
class Animals: Creature {}

class Quadrupeds: Animals {}
class Reptiloids: Animals {}

class Crocodile: Reptiloids {}
class Monkey: Animals {}
class Dog: Quadrupeds {}
class Giraffe: Quadrupeds {}

let humanOne = Human()
let humanTwo = Human()
let crocodileOne = Crocodile()
let crocodileTwo = Crocodile()
let monkeyOne = Monkey()
let monkeyTwo = Monkey()
let dogOne = Dog()
let dogTwo = Dog()

let totalCountOfCreatures = [humanOne, humanTwo, crocodileOne, crocodileTwo, monkeyOne, monkeyTwo, dogOne, dogTwo]

var totalReptiloids = [Creature]()
var totalAnimals = [Creature]()
var totalQuadrupeds = [Creature]()

for item in totalCountOfCreatures {
    if item is Animals {
        totalAnimals.append(item)
}
    if item is Reptiloids {
        totalReptiloids.append(item)
    }
    if item is Quadrupeds {
        totalQuadrupeds.append(item)
    }
}

print("Reptiloids - \(totalReptiloids.count), Quadrupeds - \(totalQuadrupeds.count), Animals - \(totalAnimals.count), Other creatures - \(totalCountOfCreatures.count)")
