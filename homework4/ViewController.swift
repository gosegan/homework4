//
//  ViewController.swift
//  homework4
//
//  Created by Denys Danylko on 06.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TASK 1
        let sailor1: Sailor = Sailor(name: "Bob")
        //bob.introduceMyself()
        
        // TASK 2-3
        let sailor2: Sailor = Sailor(name: "Adam")
        let sailor3: Sailor = Sailor(name: "Dan")
        let sailor4: Sailor = Sailor(name: "Victor")
        let sailor5: Sailor = Sailor(name: "John")
        
        let ship1: Ship = Ship("Black Pearl", arrayOfSailors: [sailor1, sailor2, sailor3, sailor4, sailor5])
        //ship1.introduceAll()
        
        // TASK 4
        let sailor6: Sailor = TitanicSailor(name: "Adam")
        let sailor7: Sailor = TitanicSailor(name: "Adam")
        let sailor8: Sailor = TitanicSailor(name: "Dan")
        let sailor9: Sailor = TitanicSailor(name: "Victor")
        let sailor10: Sailor = TitanicSailor(name: "John")
        let ship2: Ship = Titanic("Black Pearl", arrayOfSailors: [sailor6, sailor7, sailor8, sailor9, sailor10])
        //ship2.introduceAll()
        
        // TASK 5
        let percentResult: Double = CalculatorPro().calculatePercent(percent: 12, number: 14)
        //print(percentResult)
        let powerToResult = CalculatorPro().powerTo(number: 2, to: 3)
        //print(powerToResult)
        
        // TASK 6
        let calcBankDeposit: Double = SuperProCalc().calculateHardPercents(deposit: 350000, days: 273, interestRate: 4.7)
        //print(calcBankDeposit)
        
        // TASK 8
        let farmer = Farmer()
        //farmer.run()
        let brewmaster = Brewmaster()
        //brewmaster.run()
        let butcher = Butcher()
        //butcher.fight()
        let witcher = Witcher()
        //witcher.fight()
        let zoro = Zoro()
        //zoro.run()
        //zoro.fight()
        let monkeyDLuffy = MonkeyDLuffy()
        //monkeyDLuffy.fight()
        //monkeyDLuffy.run()
        
        // TASK 9-10
        //let tavern1 = Tavern(arrayMovers: [farmer, brewmaster, monkeyDLuffy, zoro], arrayFighters: [butcher, witcher, monkeyDLuffy, zoro]).enterTavern(hero: monkeyDLuffy)
        //let tavern2 = Tavern(arrayMovers: [farmer, brewmaster, monkeyDLuffy, zoro], arrayFighters: [butcher, witcher, monkeyDLuffy, zoro]).enterTavern(hero: zoro)
        
        // TASK 11
        var arrayOfNum: Array<Int> = []
        for number in 1...10 {
            arrayOfNum.append(Int.random(in: 1..<4))
        }
        
        var snake = Snake()
        
//        for (index, number) in arrayOfNum.enumerated() {
//            print("")
//            print("Step: \(index)")
//            if (number == 1) {
//                snake.move()
//            }
//            if (number == 2) {
//                snake.eat()
//            }
//            if (number == 3) {
//                snake.loseWidth()
//            }
//        }
        
        // TASK 12
        let numberArray = [2, 4, 10, 100, 15, 12, 101]
        for number in numberArray {
            //print(number.pow(to: 2))
        }
        let wordsArray = ["madam", "leaf", "hair", "eye", "headphones", "abo-oba"]
        for word in wordsArray {
            //print(word.isPalindrome())
        }
    }
    
}

// ------------------------ TASK 1 ---------------------------

class Sailor {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func introduceMyself() {
        print("Привет, моё имя - \(name)")
    }
}

// ------------------------ TASK 2-3 ---------------------------

class Ship: Shipable {
    var name: String
    var arrayOfSailors: Array<Sailor>
    
    init(_ name: String, arrayOfSailors: Array<Sailor>) {
        self.name = name
        self.arrayOfSailors = arrayOfSailors
    }
    
    func introduceAll() {
        for sailor in arrayOfSailors {
            print(sailor.introduceMyself())
        }
        
        print("Мы с корабля - " + name)
    }
}

// ------------------------ TASK 4 ---------------------------

class Titanic: Ship {
    override func introduceAll() {
        super.introduceAll()
        print("We are from ship - " + name)
    }
}

class TitanicSailor: Sailor {
    override func introduceMyself() {
        super.introduceMyself()
        print("Hello, my name is \(name)")
    }
}

// ------------------------ TASK 5 ---------------------------

class Calculator {
    func sum(num1: Int, num2: Int) -> Int {
        return num1 + num2
    }
    func subtraction(num1: Int, num2: Int) -> Int {
        return num1 - num2
    }
    func multiply(num1: Double, num2: Double) -> Double {
        return num1 * Double(num2)
    }
    func division(num1: Double, num2: Double) -> Double {
        return num1 / num2
    }
}

class CalculatorPro: Calculator {
    func calculatePercent(percent: Double, number: Double) -> Double {
        return division(num1: multiply(num1: percent, num2: number), num2: 100)
    }
    
    func powerTo(number: Int, to: Int) -> Int {
        var result: Int = 1
        for _ in 1...to {
            result = result * number
        }
        return result
    }
}

// ------------------------ TASK 6 ---------------------------

class SuperProCalc: CalculatorPro {
    func calculateHardPercents(deposit: Double, days: Double, interestRate: Double) -> Double {
        let result = super.calculatePercent(percent: interestRate, number: deposit)
        let daysResult = division(num1: days, num2: 365)
        let finalResult = multiply(num1: result, num2: daysResult)
        return Double(round(100 * finalResult) / 100)
    }
}

// ------------------------ TASK 7 ---------------------------

protocol Movable {
    func run()
}

protocol Fightable {
    func fight()
}

protocol Hero: Movable, Fightable {
    var name: String { get set }
}

// ------------------------ TASK 8 ---------------------------

struct Farmer: Movable {
    var name: String = "Farmer"
    
    func run() {
        print("\(name): run")
    }
}

struct Brewmaster: Movable {
    var name: String = "Brewmaster"
    
    func run() {
        print("\(name): run")
    }
}

struct Butcher: Fightable {
    var name: String = "Butcher"
    
    func fight() {
        print("\(name): fight")
    }
}

struct Witcher: Fightable {
    var name: String = "Witcher"
    
    func fight() {
        print("\(name): fight")
    }
}

struct Zoro: Hero {
    var name: String = "Zoro"
    
    func run() {
        print("\(name): run")
    }
    func fight() {
        print("\(name): fight")
    }
}

struct MonkeyDLuffy: Hero {
    var name: String = "Monkey D. Luffy"
    
    func run() {
        print("\(name): run")
    }
    func fight() {
        print("\(name): fight")
    }
}

// ------------------------ TASK 9-10 ---------------------------

class Tavern {
    var arrayMovers: Array<Movable>
    var arrayFighters: Array<Fightable>
    
    init(arrayMovers: Array<Movable>, arrayFighters: Array<Fightable>) {
        self.arrayMovers = arrayMovers
        self.arrayFighters = arrayFighters
    }
    
    func enterTavern(hero: Hero) {
        hero.fight()
        
        for mover in arrayMovers {
            print(mover.run())
        }
        
        for figher in arrayFighters {
            print(figher.fight())
        }
    }
}

// ------------------------ TASK 12 ---------------------------

extension Int {
    func pow(to: Int) -> Int {
        var result: Int = 1
        
        for _ in 1...to {
            result = self * result
        }
        return result
    }
}

extension String {
    func isPalindrome() -> Bool {
        var startIndex = self.startIndex
        var endIndex = self.endIndex
        endIndex = self.index(before: endIndex)
        while startIndex < endIndex {
            if self[startIndex] != self[endIndex] {
                return false
            }
            startIndex = self.index(after: startIndex)
            endIndex = self.index(before: endIndex)
        }
        return true
    }
}

// ------------------------ TASK 13 ---------------------------

protocol Shipable {
    var name: String { get set }
    var arrayOfSailors: Array<Sailor> { get set }
    
    func introduceAll()
}
