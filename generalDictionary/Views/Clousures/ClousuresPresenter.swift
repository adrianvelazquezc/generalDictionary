//
//  ClousuresPresenter.swift
//  generalDictionary
//
//  Created by Mac on 19/01/23.
//

import Foundation

class ClousuresPresenter {
    var interactor: ClousuresInteractorProtocol?
    weak var view: ClousuresViewProtocol?
    var router: ClousuresRouterProtocol?
}



extension ClousuresPresenter: ClousuresPresenterProtocol {
    func requestExampleView(delegate: exampleProtocol) {
        self.router?.navigateExampleView(delegate: delegate)
    }
    
    
}
