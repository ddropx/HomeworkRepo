import UIKit


// 1. Создать класс Rectangle, у которого будут свойства Длина и Ширина, реализовать два инициализатора, один основной, второй вспомогательный, основной должен принимать значения длины и ширины, вспомогательный должен принимать значение только одно стороны, что бы в итоге инициализировался квадрат

class Rectangle {
    // Свойство ширины и длины
    let width: Int
    let length: Int
    
    // Основной инициализатор
    init(width: Int, length: Int) {
        self.width = width
        self.length = length
    }
    
    // Инициализатор квадрата
    convenience init(sideLength: Int) {
        self.init(width: sideLength, length: sideLength)
    }
}

var square = Rectangle(sideLength: 4)
print("Square is \(square.length) in length and \(square.width) in width")

var newRectangle = Rectangle(width: 6, length: 1)
print("Rectangle is \(newRectangle.length) in length and \(newRectangle.width) in width")

// Создать класс Человек с именем, фамилией и соответствующим инициализатором для данных свойств (свойства должны быть константами). Создать класс Студент, который наследуется от класса Человек и к которому добавляется свойство Курс, добавить классу Студент инициализатор с именем, фамилией, курсом, так жу у студента должен быть вспомогательный инициализатор с именем и фамилией, при инциализации вспомогательныйм инициализатором свойство курс должно проставиться значением 1. Создать класс Бомж, наследуемся от класса Студент, у бомжа должен быть инициализатор с именем, который будет принимать значение по умолчанию = "Бомж", в итоге после инициализации класса через init() у объекта должны быть проинициализированы значения со следующими значениями: имя = Бомж, фамилия должна быть nil, курс = 1

class Human {
    let name: String
    let surname: String?
    
    init(name: String, surname: String?) {
        self.name = name
        self.surname = surname
    }
}

class Student: Human {
    let grade: Int
    
    init(name: String, surname: String?, grade: Int) {
        self.grade = grade
        super.init(name: name, surname: surname)
        }
    convenience override init(name: String, surname: String?) {
        self.init(name: name, surname: surname, grade: 1)
    }
    func toStr() {
        print(grade)
//        print(surname)
        print(name)
    }
}
var studentOne = Student(name: "Alex", surname: "Scooter", grade: 1)
studentOne.toStr()

class Homeless: Student {

    required init(name: String) {
        
        super.init(name: name, surname: nil, grade: 1)
    }
}

var homelessOne = Homeless(name: "Alex")
homelessOne.toStr()


// Создать класс BestBank, который инициализируется символом и содержит свойство Имя, если инициализировать данный класс символом "Т", то значение свойства Имя должно быть "Тинькофф", при попытке инициализации другим символом должно вернуться nil (то есть класс не должен инициализироваться вовсе)

class BestBank {
    
    let name: String
    
    init?(symbol: Character) {
        if symbol == "T" {
            name = "Tinkoff"
        } else {
            return nil
        }
    }
}


let bankOne = BestBank(symbol: "T")
bankOne?.name

let bankTwo = BestBank(symbol: "R")
bankTwo
bankTwo?.name
