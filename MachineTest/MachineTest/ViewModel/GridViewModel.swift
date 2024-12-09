//
//  GridViewModel.swift
//  MachineTest
//
//  Created by Ashutosh Chourasiya on 09/12/24.
//

import Foundation
import UIKit

class GridViewModel {
    private(set) var gridSize: Int = 0
    
    var numberOfCells: Int {
        return gridSize * gridSize
    }
    
    var releadCollectionView: (() -> Void)?
    var showAlert: ((String) -> Void)?
        
    func validateAndGenerateGrid (_ gridNumber: Int) {
        if GridValidator.isValidGridNumber(gridNumber) {
            self.showAlert?("Please enter valid grid number")
            return
        }
        self.gridSize = Int(sqrt(Double(gridNumber)))
        self.releadCollectionView?()
    }
}
