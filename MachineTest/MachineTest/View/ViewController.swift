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
    
    var gridViewModel = GridViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.gridCollection.delegate = self
        self.gridCollection.dataSource = self
        self.gridCollection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        self.setUpBindingWithModel()
    }
    
    private func setUpBindingWithModel() {
        self.gridViewModel.releadCollectionView = { [weak self] in
            self?.gridCollection.reloadData()
        }
        
        self.gridViewModel.showAlert = { [weak self] message in
            self?.showAlert(message: message)
        }
        
        self.gridViewModel.updateCell = { [weak self] index in
            self?.gridCollection.reloadItems(at: [IndexPath(item: index, section: 0)])
        }
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
    
    @IBAction func submitButtonClick(_ sender: UIButton) {
        let number = Int(self.textField.text ?? "") ?? 0
        self.gridViewModel.validateAndGenerateGrid(number)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.gridViewModel.numberOfCells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let isGreen = self.gridViewModel.gridModel?.cells[indexPath.item].isGreen ?? false
        let isGridEqual = self.gridViewModel.redCellIndex == indexPath.item
        cell.backgroundColor = isGridEqual ? .red : isGreen ? .green : .gray
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.gridViewModel.makeCellAsGreen(at: indexPath.item)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.frame.width
        let numberOfCellPerRow = CGFloat(self.gridViewModel.gridSize)
        let interItemSpacing = 10.0
        let sectionInsets = 20.0
        let totolSpacing = (numberOfCellPerRow - 1) * interItemSpacing + sectionInsets
        let cellWidth = (collectionViewWidth - totolSpacing)/numberOfCellPerRow
        return CGSize(width: cellWidth, height: cellWidth)
    }
}
