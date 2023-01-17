//
//  APISEntity.swift
//  generalDictionary
//
//  Created by Mac on 16/01/23.
//

import Foundation

struct PokemonListResponse:Codable {
    let count: Int?
    let next: String?
    let previous: String?
    let results: [PokemonResult]?
}

struct PokemonResult:Codable{
    let name: String?
    let url: String?
}

