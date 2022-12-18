//
//  CollectionViewController.swift
//  JSONParseApp
//
//  Created by Olga Tegza on 13.12.2022.
//

import UIKit

enum UserAction: String, CaseIterable {
    case showProduct = "Show Product"
    case showImage = "Show Image"
}

class MainViewController: UICollectionViewController {
    
    private let userActions = UserAction.allCases
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        userActions.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? UserActionCell else {
            return UICollectionViewCell()
        }
        cell.userActionLabel.text = userActions[indexPath.item].rawValue
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userAction = userActions[indexPath.item]
        
        switch userAction {
        case .showProduct:
            performSegue(withIdentifier: "showProduct", sender: nil)
        case .showImage:
            performSegue(withIdentifier: "showImage", sender: nil)
        }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showProduct" {
            guard let productVC = segue.destination as? ProductTableViewController else { return }
            productVC.fetchProduct()
        }
    }
    
    // MARK: - Private Methods
    private func successAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Success",
                message: "You can see the results in the Debug aria",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
    
    private func failedAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(
                title: "Failed",
                message: "You can see error in the Debug aria",
                preferredStyle: .alert
            )
            
            let okAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(okAction)
            self.present(alert, animated: true)
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 48, height: 100)
    }
}
//
//private func fetchProduct() {
//    NetworkManager.shared.fetch(Product.self, from: Link.productURL.rawValue) { [weak self] result in
//        switch result {
//        case .success(let product):
//            print(product)
//            self?.successAlert()
//        case .failure(let error):
//            print(error)
//            self?.failedAlert()
//        }
//    }
//}
