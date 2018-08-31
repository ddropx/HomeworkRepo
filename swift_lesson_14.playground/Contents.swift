import UIKit

//task 1

class notHuman {
    static let minAge = 0
    static let maxAge = 100
    static let minFirstNameLength = 1
    static let maxFirstNameLength = 60
    static let minLastNameLength = 1
    static let maxLastNameLength = 60
    static let minHeight = 20
    static let minWeight = 5
    
    static var count = 0

var firstName: String {
    didSet {
        if (firstName.count < notHuman.minFirstNameLength) || (firstName.count > notHuman.maxFirstNameLength) {
            firstName = oldValue}
        }
    }

var lastName: String {
    didSet {
    if (lastName.count < notHuman.minLastNameLength) || (lastName.count > notHuman.maxLastNameLength) {
        lastName = oldValue }
       }
    }
var age: Int {
    didSet {
        if (age < notHuman.minAge) || (age > notHuman.maxAge) {
            age = oldValue
        }
    }
}
    
var height: Int {
        didSet {
            if (height < notHuman.minAge) || (height > notHuman.maxAge) {
                height = oldValue
        }
    }
}

var weight: Int {
        didSet {
            if (weight < notHuman.minAge) || (weight > notHuman.maxAge) {
                weight = oldValue
        }
    }
}
init (firstName: String, lastName: String, age: Int, height: Int, weight: Int) {
    self.firstName = firstName
    self.lastName = lastName
    self.age = age
    self.height = height
    self.weight = weight
    notHuman.count += 1
   }
}

var firstHuman = notHuman(firstName: "Elon", lastName: "Musk", age: 47, height: 184, weight: 120)
print(firstHuman.firstName)
print(notHuman.count)
print("")
var secondHuman = notHuman(firstName: "Maxim", lastName: "Kuznetsov", age: 44, height: 152, weight: 137)
print(secondHuman.weight)
print(notHuman.count)

//task 2
print("")

struct Point {
    var x = 0.0, y = 0.0
}
struct Segment {
    var pointA = Point()
    var pointB = Point()
    
    var centerSegment: Point {
        get {
            let centerX = pointA.x + pointB.x / 2
            let centerY = pointA.y + pointB.y / 2
            return Point(x: centerX, y: centerY)
        }
        set {
            pointA.x = newValue.x - pointB.x / 2
            pointB.x = newValue.y - pointB.y / 2
        }
    }
    var length : Double {
        get {
            return sqrt(pow((pointB.x - pointA.x), 2) + pow((pointB.y - pointA.y), 2))
        }
        set {
            pointB = Point(x: pointA.x + (pointB.x - pointA.x) * newValue / length, y: pointA.y + (pointB.y - pointA.y) * newValue / length)
        }
    }
}

var segment = Segment(pointA: Point(x: 1, y: 1), pointB: Point(x: 2, y: 2))

segment
segment.length = 6
segment



//task 3

enum ColorPalette: Int {
    
    static let numberOfColors = 3
    static let firstColor = ColorPalette.red
    static let lastColor = ColorPalette.green
    
    case red = 0xff0000
    case blue = 0x0000ff
    case green = 0x00ff00
}

ColorPalette.lastColor.rawValue
print(ColorPalette.lastColor)

//end
