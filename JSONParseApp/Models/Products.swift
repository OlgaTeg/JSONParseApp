//
//  Products.swift
//  JSONParseApp
//
//  Created by Olga Tegza on 13.12.2022.
//

struct Products: Decodable {
    let id: Int
    let title: String
    let description: String
    let price: Int
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String
    let category: String
    let thumbnail: String
    let images:[String]
}
