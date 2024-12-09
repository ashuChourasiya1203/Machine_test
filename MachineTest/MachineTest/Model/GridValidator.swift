//
//  GridValidator.swift
//  MachineTest
//
//  Created by Ashutosh Chourasiya on 09/12/24.
//
import Foundation

class GridValidator {
    static func isValidGridNumber (_ gridNumber: Int) -> Bool {
        let squareRoot = Int(sqrt(Double(gridNumber)))
        return squareRoot * squareRoot == Int(gridNumber)
    }
    
    static func isValidGridSize (_ gridSize: Int) -> Bool {
        return gridSize > 0 && gridSize < 100
    }
}

class GridModel {
    private(set) var cells: [GridCell]
    
    init(numberOfCells: Int) {
        self.cells = Array(repeating: GridCell(), count: numberOfCells)
    }
    
    func makeCellAsGreen(at index: Int) {
        self.cells[index].isGreen = true
    }
    
    func isGridGameComplete() -> Bool {
        return cells.allSatisfy{ $0.isGreen }
    }
}

struct GridCell {
    var isGreen = false
}
