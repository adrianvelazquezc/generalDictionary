//
//  HomePresenter.swift
//  generalDictionary
//
//  Created by Mac on 05/01/23.
//

import Foundation

class HomePresenter {
    var interactor: HomeInteractorProtocol?
    weak var view: HomeViewProtocol?
    var router: HomeRouterProtocol?
}



extension HomePresenter: HomePresenterProtocol {
    
}
