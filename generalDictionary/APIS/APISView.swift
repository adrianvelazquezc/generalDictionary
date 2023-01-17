//
//  APISView.swift
//  generalDictionary
//
//  Created by Mac on 16/01/23.
//

import Foundation
import UIKit

class APISView: UIViewController {
    var presenter: APISPresenterProtocol?
    private var ui: APISViewUI?
    internal var vcTitle: String?
    
    override func loadView() {
        ui = APISViewUI(
            navigation: self.navigationController!,
            delegate: self
        )
        view = ui
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.requestListPokemon()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationBar.standardAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        self.title = vcTitle
        self.navigationController?.isNavigationBarHidden = false
    }
}

extension APISView: APISViewProtocol {
    func notifyListPokemon(pokemon: [PokemonResult]) {
        ui?.pokedexInfo = pokemon
        print(pokemon)
//        ui?.pokedexInfo.reloadData()
        DispatchQueue.main.async {
            self.ui?.tableView.reloadData()
        }
    }
    
    
}

extension APISView: APISViewUIDelegate {
    func notifyNextView(url: String) {
        self.presenter?.requestNextView(url: url)
    }

}
