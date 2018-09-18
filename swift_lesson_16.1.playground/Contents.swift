
import Foundation
struct Room {
    var width: Int
    var height: Int
}
struct Point {
    var x: Int = 0
    var y: Int = 0
    
    mutating func moveToX (x: Int, andY y: Int) {
        let x = x
        self = Point(x: self.x + x, y: self.y + y)
    }
}

enum Direction {
    case Left
    case Right
    case Up
    case Down
}

class Hero {
    var count = 0  // Количество набранных очков при завершении игры
    
    class var name: Character {
        return "🐓"
    }
    
    class var item: Character {
        return "🎤"
    }
    
    class var endPoint: Character {
        return "📍"
    }
    
    // Выход за пределы комнаты, возвращая предыдущее значение
    var position: Point {
        didSet {
            if position.x >= room.width || position.x <= 1 {
                position = oldValue
            }
            if position.y >= room.height || position.y <= 1 {
                position = oldValue
            }
        }
    }
    
    var item: Point {
        didSet {
            if position.x >= room.width || position.x <= 1 {
                item = oldValue
                position = oldValue
            }
            if position.y >= room.height || position.y <= 1 {
                item = oldValue
                position = oldValue
            }
        }
    }
    
    var endPoint: Point {
        didSet {
            if position.x >= room.width || position.x <= 1 {
                endPoint = oldValue
            }
            if position.y >= room.height || position.y <= 1 {
                endPoint = oldValue
            }
        }
    }
    
    var room: Room
    
    init(position: Point, room: Room, item: Point, endPoint: Point) {
        self.position = position
        self.room = room
        self.item = item
        self.endPoint = endPoint
    }
    // Управление героем в комнате
    func move (direction: Direction, position: Point) -> Point {
        var position = position
        switch direction {
        case .Left : position.moveToX(x: -1, andY: 0)
        case .Right: position.moveToX(x: 1, andY: 0)
        case .Up: position.moveToX(x: 0, andY: -1)
        case .Down: position.moveToX(x: 0, andY: 1)
        }
        return position
    }
    // Передвижение героя за предметом
    func moveHero (direction: Direction) {
        let oldItemPosition = item
        
        position = move(direction: direction, position: position)
        if position.x == item.x && position.y == item.y {
            item = move(direction: direction, position: item)
            if oldItemPosition.x == position.x && oldItemPosition.y == position.y {
                position = oldItemPosition
                
                // Окончание игры + респаун
                if item.x == endPoint.x && item.y == endPoint.y {
                    let randomHeroX = Int.random(in: 3 ... 8)
                    let randomHeroY = Int.random(in: 3 ... 8)
                    let randomItemX = Int.random(in: 3 ... 8)
                    let randomItemY = Int.random(in: 3 ... 8)
                    position.x = randomHeroX
                    position.y = randomHeroY
                    item.x = randomItemX
                    item.y = randomItemY
                    self.count += 1
                    print()
                    print("Your score is \(count)")
                    print("You win")
                }
            }
        }
    }
    
    // Печать комнаты в консоль
    func showRoom() {
        for i in 1...room.width {
            print()
            for j in 1...room.height {
                switch (i, j) {
                case let (y, x) where x == position.x && y == position.y :
                    print("\(Hero.name)", terminator: "")
                case let (y, x) where x == endPoint.x && y == endPoint.y :
                    print("\(Hero.endPoint)", terminator: "")
                case let (y, x) where x == item.x && y == item.y :
                    print("\(Hero.item)", terminator: "")
                case _ where (i == 1 || j == 1 || i == room.width || j == room.height) :
                    print("⬛️", terminator: "")
                    
                default: print("◻️", terminator: "")
                    
                }
            }
        }
    }
}

let player = Hero(position: Point(x: 2, y: 2), room: Room(width: 10, height: 10), item: Point(x: 3, y: 3), endPoint: Point(x:4, y: 4))

// 1
print()
player.showRoom()
player.moveHero(direction: .Down)
player.showRoom()
player.moveHero(direction: .Right)
player.showRoom()
player.moveHero(direction: .Up)
player.showRoom()
player.moveHero(direction: .Right)
player.showRoom()
player.moveHero(direction: .Down)



