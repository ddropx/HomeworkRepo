//: Playground - noun: a place where people can play

import UIKit

// Задание - Создайте расширение для Int со свойствами isNegative, isPositive, которые должны возвращать Bool. Добавьте свойство, которое возвращает количество символов в числе. Добавьте метод, который возвращает символ числа по индексу. Добавить стрингу метод truncate, чтобы отрезал лишние символы и, если таковые были, заменял их на троеточие.

extension Int {
    var isPositive: Bool {
        return self > 0
    }
    var isNegative: Bool {
        return !isPositive
    }
    var checkForValid: Bool {
        return self != 0
    }
    var symbolCount: Int {
        return String(self).count
    }
    subscript(symbolForIndex: Int) -> Int {
        var symbol = 1
        for _ in 0..<symbolForIndex {
            symbol *= 10
        }
        return(self / symbol) % 10
    }
}

let a = 20
a.checkForValid
a.isNegative
let b = -555
b.isPositive
a.symbolCount
b.symbolCount

print(a[1])

extension String {
    subscript(value: Range<Int>) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: value.lowerBound)
        let endIndex = self.index(self.startIndex, offsetBy: value.upperBound - value.lowerBound)
        return String(self[Range(startIndex..<endIndex)])
    }
    func truncate(index: Int) -> String {
        var string = " "
        for (i, j) in self.enumerated() {
            switch i {
            case index: string.append("...")
            case _ where i < index: string.append(j)
            default: break
            }
        }
        return string
    }
}

let testString = "Skutarenko"
testString[0..<8]
testString.truncate(index: 7)

// new changes included 1.0
