//
//  ViewController.swift
//  MachineTest
//
//  Created by Ashutosh Chourasiya on 09/12/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var gridCollection: UICollectionView!
    @IBOutlet weak var textField: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.gridCollection.delegate = self
        self.gridCollection.dataSource = self
    }
    
    @IBAction func submitButtonClick(_ sender: UIButton) {
        let gridSize = Int(self.textField.text ?? "") ?? 0
        guard GridValidator.isValidGridSize(gridSize),
              GridValidator.isValidGridNumber(gridSize)
        else {
            self.showAlert(message: "Please enter valid grid size")
            return
        }
         
        
    }
    
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
}
