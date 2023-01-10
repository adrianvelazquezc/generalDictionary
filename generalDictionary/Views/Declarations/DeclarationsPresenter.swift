//
//  DeclarationsPresenter.swift
//  generalDictionary
//
//  Created by Mac on 09/01/23.
//

import Foundation

class DeclarationsPresenter {
    var interactor: DeclarationsInteractorProtocol?
    weak var view: DeclarationsViewProtocol?
    var router: DeclarationsRouterProtocol?
}



extension DeclarationsPresenter: DeclarationsPresenterProtocol {
    
}
