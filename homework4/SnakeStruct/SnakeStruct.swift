//
//  SnakeStruct.swift
//  homework4
//
//  Created by Denys Danylko on 08.11.2022.
//

import Foundation

class Snake: SnakeEatable, SnakeMovable, SnakeLoose {
    private var width = 5
    
    private func increment() {
        width = width + 1
    }
    
    private func decrement() {
        width = width - 1
    }
    
    private func checkWidth() {
        print("Your current width is: ", width)
    }
    
    private func onlyMoved() {
        print("Moved for cell further")
    }
    
    func move() {
        onlyMoved()
        checkWidth()
    }
    
    func eat() {
        onlyMoved()
        print("Ate 1 apple")
        increment()
        checkWidth()
    }
    
    func loseWidth() {
        onlyMoved()
        print("Oops! You was smashed to the wall!")
        decrement()
        checkWidth()
    }
    
}
