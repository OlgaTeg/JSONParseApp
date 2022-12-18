//
//  ProductTableViewController.swift
//  JSONParseApp
//
//  Created by Olga Tegza on 16.12.2022.
//

import UIKit

class ProductTableViewController: UITableViewController {
    

    private var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 120
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "cell",
                for: indexPath
            ) as? ProductCell
        else {
            return UITableViewCell()
        }

        let product = product
        
        cell.configure(with: product)

        return cell
    }

}
    
// MARK: - Networking
extension ProductTableViewController {
    func fetchProduct() {
        NetworkManager.shared.fetch(Product.self, from: Link.productURL.rawValue) { [weak self] result in
            switch result {
            case .success(let product):
                self?.product = product
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
