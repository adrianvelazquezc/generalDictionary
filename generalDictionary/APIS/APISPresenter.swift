//
//  APISPresenter.swift
//  generalDictionary
//
//  Created by Mac on 16/01/23.
//

import Foundation

class APISPresenter {
    var interactor: APISInteractorProtocol?
    weak var view: APISViewProtocol?
    var router: APISRouterProtocol?
}



extension APISPresenter: APISPresenterProtocol {
    func responseListPokemon(pokemon: [PokemonResult]) {
        self.view?.notifyListPokemon(pokemon: pokemon)
    }
    
    func requestListPokemon() {
        self.interactor?.getListPokemon()
    }
    
    func requestNextView(url: String) {
        self.router?.navigateNextView(url: url)
    }
    
    
}
