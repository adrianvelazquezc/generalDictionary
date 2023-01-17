//
//  SecondApiPresenter.swift
//  generalDictionary
//
//  Created by Mac on 17/01/23.
//

import Foundation

class SecondApiPresenter {
    var interactor: SecondApiInteractorProtocol?
    weak var view: SecondApiViewProtocol?
    var router: SecondApiRouterProtocol?
}



extension SecondApiPresenter: SecondApiPresenterProtocol {
    func requestPokemonInfo() {
        self.interactor?.getPokemonInfo()
    }
    
    func responsePokemonInfo(pokemon: PokemonDetailResponse) {
        self.view?.notifyPokemonInfo(pokemon: pokemon)
    }
    
    
}
