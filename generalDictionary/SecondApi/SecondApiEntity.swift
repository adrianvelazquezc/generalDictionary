//
//  SecondApiEntity.swift
//  generalDictionary
//
//  Created by Mac on 17/01/23.
//

import Foundation

struct PokemonDetailResponse: Codable {
    let habilities: [PokemonHabilities]?
    let types: [PokemonTypes]?
    let height: Float?
    let id: Int?
    let name: String?
    let weight: Float?
    let sprites: PokemonSprites?
    
    struct PokemonSprites: Codable{
        let back_default: String?
        let back_female: String?
        let back_shiny: String?
        let back_shiny_female: String?
        let front_default: String?
        let front_default_female: String?
        let front_shiny: String?
        let front_shiny_default: String?
    }
    
    struct PokemonTypes: Codable{
        let slot: Int?
        let type: PType?
        
        struct PType: Codable{
            let name: String?
            let turl: String?
        }
    }
    struct PokemonHabilities:Codable{
        let hability: Hability?
        let is_hidden: Bool?
        let slot: Int?
        
        struct Hability:Codable{
            let name: String?
            let url: String?
        }
    }
}
