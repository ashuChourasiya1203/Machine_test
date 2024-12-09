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
