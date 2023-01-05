//
//  HomeView.swift
//  generalDictionary
//
//  Created by Mac on 05/01/23.
//

import Foundation
import UIKit

class HomeView: UIViewController {
    var presenter: HomePresenterProtocol?
    private var ui: HomeViewUI?
    
    override func loadView() {
        ui = HomeViewUI(
            navigation: self.navigationController!,
            delegate: self
        )
        view = ui
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //se oculto la barra de navegacion
        self.navigationController?.isNavigationBarHidden = true
    }
}

extension HomeView: HomeViewProtocol {
    
}

extension HomeView: HomeViewUIDelegate {
    
}
