//
//  HomePresenter.swift
//  generalDictionary
//
//  Created by Mac on 05/01/23.
//

import Foundation

class HomePresenter {
    weak var view: HomeViewProtocol?
    var router: HomeRouterProtocol?
}



extension HomePresenter: HomePresenterProtocol {
    func requestNextView(view: List) {
        self.router?.navigateNextView(view: view)
    }
    
    
}
