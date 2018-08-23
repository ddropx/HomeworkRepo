import Foundation


// task 1. Создайте структуру студент. Добавьте свойства: имя, фамилия, год рождения, средний бал. Создайте несколько экземпляров этой структуры и заполните их данными. Положите их всех в массив (журнал).


struct Student {
    var name : String
    var surname : String
    var birthYear: Int
    var averageRating : Int
}

var firstStudent = Student(name: "Ivan", surname: "Krizhanovskiy", birthYear: 1995, averageRating: 4)
var secondStudent = Student(name: "Anton", surname: "Chernyshev", birthYear: 1994, averageRating: 5)
var thirdStudent = Student(name: "Vladimir", surname: "Krizhanovskiy", birthYear: 1975, averageRating: 3)
var fourthStudent = Student(name: "Maxim", surname: "Kuznetsov", birthYear: 1969, averageRating: 2)

var journalArray = [firstStudent, secondStudent, thirdStudent, fourthStudent]
for i in journalArray {
    print(i)
}

// task 2. Напишите функцию, которая принимает массив студентов и выводит в консоль данные каждого. Перед выводом каждого студента добавляйте порядковый номер в “журнале”, начиная с 1.
print("")
func printStudentArray (studentArray: [Student]) {
    var number = 0
    for i in studentArray {
        number += 1
        print("\(number). \(i)")
    }
}
printStudentArray(studentArray: journalArray)

// task 3. С помощью функции sorted отсортируйте массив по среднему баллу, по убыванию и распечатайте “журнал”.
print("")
var numbers =
    journalArray.sorted() {$0.averageRating > $1.averageRating}
for i in numbers {
print(i)
}

// task 4. Отсортируйте теперь массив по фамилии (по возрастанию), причем если фамилии одинаковые, а вы сделайте так чтобы такое произошло, то сравниваются по имени. Распечатайте “журнал”.
print("")
var sorting = journalArray.sorted() {$0.surname < $1.surname || ($0.surname == $1.surname && $0.name < $0.name)}

for i in sorting {
    print(i)
}

