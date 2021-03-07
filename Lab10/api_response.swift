//
//  api_response.swift
//  Lab10
//
//  Created by Daniel Cubillo on 6/3/21.
//

import Foundation

// MARK: - api_response
struct api_response: Decodable {
    let data: [Datum]
    let page, pageSize, count, totalCount: Int?
}

// MARK: - Datum
struct Datum: Decodable {
    let id, name: String
    let level, hp: String?
    let number, artist, rarity: String?
    let nationalPokedexNumbers: [Int]?
    let images: DatumImages
    let flavorText: String?
    let rules: [String]?
}


// MARK: - DatumImages
struct DatumImages: Decodable {
    let small, large: String
}

