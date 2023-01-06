//
//  ControllersPresenter.swift
//  generalDictionary
//
//  Created by Mac on 06/01/23.
//

import Foundation

class ControllersPresenter {
    var interactor: ControllersInteractorProtocol?
    weak var view: ControllersViewProtocol?
    var router: ControllersRouterProtocol?
}



extension ControllersPresenter: ControllersPresenterProtocol {
    
}
