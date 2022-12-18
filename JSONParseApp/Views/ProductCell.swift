//
//  ProductCell.swift
//  JSONParseApp
//
//  Created by Olga Tegza on 16.12.2022.
//

import UIKit

class ProductCell: UITableViewCell {
    
    @IBOutlet var productTitleLable: UILabel!
    @IBOutlet var brandLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    func configure(with product: Product) {
        productTitleLable.text = product.title ?? ""
        brandLabel.text = product.brand ?? ""
        descriptionLabel.text = product.description ?? ""
        priceLabel.text = String(describing: product.price ?? 0)
    }
}
