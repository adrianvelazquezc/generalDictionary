//
//  ConstrainsPresenter.swift
//  generalDictionary
//
//  Created by Mac on 06/01/23.
//

import Foundation

class ConstrainsPresenter {
    var interactor: ConstrainsInteractorProtocol?
    weak var view: ConstrainsViewProtocol?
    var router: ConstrainsRouterProtocol?
}



extension ConstrainsPresenter: ConstrainsPresenterProtocol {
    
}
