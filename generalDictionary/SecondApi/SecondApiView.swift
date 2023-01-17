//
//  SecondApiView.swift
//  generalDictionary
//
//  Created by Mac on 17/01/23.
//

import Foundation
import UIKit

class SecondApiView: UIViewController {
    var presenter: SecondApiPresenterProtocol?
    private var ui: SecondApiViewUI?
    
    override func loadView() {
        ui = SecondApiViewUI(
            navigation: self.navigationController!,
            delegate: self
        )
        view = ui
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationBar.standardAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        self.presenter?.requestPokemonInfo()
        self.navigationController?.isNavigationBarHidden = false
    }
    
}

extension SecondApiView: SecondApiViewProtocol {
    func notifyPokemonInfo(pokemon: PokemonDetailResponse) {
        DispatchQueue.main.async {
            self.title = pokemon.name
            self.ui?.upgradeInfo(pokemon: pokemon)
        }
    }
    
    
}

extension SecondApiView: SecondApiViewUIDelegate {
    
}
