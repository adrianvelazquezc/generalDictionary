//
//  SecondApiProtocols.swift
//  generalDictionary
//
//  Created by Mac on 17/01/23.
//

import Foundation

protocol SecondApiViewProtocol: AnyObject {
    func notifyPokemonInfo(pokemon: PokemonDetailResponse)
}

protocol SecondApiInteractorProtocol: AnyObject {
    func getPokemonInfo()
}

protocol SecondApiPresenterProtocol: AnyObject {
    func requestPokemonInfo()
    func responsePokemonInfo(pokemon: PokemonDetailResponse)
}

protocol SecondApiRouterProtocol: AnyObject {
    
}
