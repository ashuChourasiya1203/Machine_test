//
//  GridViewModel.swift
//  MachineTest
//
//  Created by Ashutosh Chourasiya on 09/12/24.
//

import Foundation
import UIKit

class GridViewModel {
    var gridModel: GridModel?
    private(set) var redCellIndex: Int?
    private(set) var gridSize: Int = 0
    
    var numberOfCells: Int {
        return self.gridSize * self.gridSize
    }
    var releadCollectionView: (() -> Void)?
    var showAlert: ((String) -> Void)?
    var updateCell: ((Int) -> Void)?
        
    func validateAndGenerateGrid (_ gridNumber: Int) {
        guard GridValidator.isValidGridNumber(gridNumber) else {
            self.showAlert?("Please enter valid grid number")
            return
        }
        guard GridValidator.isValidGridSize(gridNumber) else {
            self.showAlert?("Please enter valid grid size")
            return
        }
        self.gridSize = Int(sqrt(Double(gridNumber)))
        self.gridModel = GridModel(numberOfCells: gridNumber)
        self.releadCollectionView?()
        self.startGameLoop()
    }
    
    func makeCellAsGreen(at index: Int) {
        guard let redCellIndex = self.redCellIndex, redCellIndex == index else {
            return
        }
        self.gridModel?.makeCellAsGreen(at: index)
        self.updateCell?(index)
        self.redCellIndex = nil
        
        if gridModel?.isGridGameComplete() ?? false {
            self.showAlert?("YOU WON THE GAME")
        } else {
            self.startGameLoop()
        }
    }
    
    func startGameLoop() {
        DispatchQueue.main.asyncAfter(deadline: .now() + Double.random(in: 3...5)) { [weak self] in
            guard let self else { return }
            if let redCellIndex = self.redCellIndex {
                self.updateCell?(redCellIndex)
            }
            if let count = self.gridModel?.cells.count {
                self.redCellIndex = Int.random(in: 0..<count)
                self.updateCell?(self.redCellIndex ?? 0)
            }
        }
    }
}
