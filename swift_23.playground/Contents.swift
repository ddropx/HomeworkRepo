//: Playground - noun: a place where people can play

import UIKit

class Human {
    var mother: Female?
    var father: Male?
    var brothers: [Male]?
    var sisters: [Female]?
    var animals: [Animal]?
}

class Male: Human {
    func moveSofa() {
        print("I can move the sofa")
    }
}

class Female: Human {
    func giveInstruction() {
        print("Can you move the sofa, please?")
    }
}

class Animal {
    func battleRoar() {
        print("")
    }
}

class Cat: Animal {
    override func battleRoar() {
        print("Meow bleat")
    }
}

class Oleg: Animal {
    override func battleRoar() {
        print("Vanya did you do your homework?")
    }
}

func generate() -> (Male, [Human]) {
    let males = [Male(), Male(), Male(), Male(), Male()]
    let females = [Female(), Female(), Female(), Female(), Female(), Female()]
    
    let human = males[4]
    
    human.father = males[0]
    human.mother = females[0]
    
    // add uncles and aunts to generation (father's & mother's)
    
    human.mother?.brothers = [males[1], males[2], males[3]]
    human.mother?.sisters = [females[1]]
    
    human.father?.sisters = [females[2], females[3], females[4]]
    
    // add grandfather and grandmother
    
    human.father?.father = males[4]
    human.mother?.mother = females[5]
    
    // add pets
    
    human.mother?.animals = [Oleg()]
    human.father?.animals = [Cat(), Cat()]
    
    return (human, males as [Human] + females)
}

let (human, humans) = generate()

var count = (aunts: 0, uncles: 0, females: 0, males: 0, olegs: 0, cats: 0)

count.uncles += human.mother?.brothers?.count ?? 0
count.aunts += human.mother?.sisters?.count ?? 0
count.aunts += human.father?.sisters?.count ?? 0

for i in humans {
    if let hum = i as? Male {
        count.males += 1
        hum.moveSofa()
    } else if let hum = i as? Female {
        count.females += 1
        hum.giveInstruction()
    }
}

for anyHumans in humans {
    if anyHumans.animals == nil {
        continue
    }
    
    for animal in anyHumans.animals! {
        switch animal {
        case is Oleg: count.olegs += 1
            animal.battleRoar()
        case is Cat: count.cats += 1
            animal.battleRoar()
        default: break
        }
    }
}

print(count)
