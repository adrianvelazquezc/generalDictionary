//
//  APISProtocols.swift
//  generalDictionary
//
//  Created by Mac on 16/01/23.
//

import Foundation

protocol APISViewProtocol: AnyObject {
    func notifyListPokemon(pokemon: [PokemonResult])
}

protocol APISInteractorProtocol: AnyObject {
    func getListPokemon()
}

protocol APISPresenterProtocol: AnyObject {
    func requestListPokemon()
    func responseListPokemon(pokemon: [PokemonResult])
    func requestNextView(url: String)
}

protocol APISRouterProtocol: AnyObject {
    func navigateNextView(url: String)
}
