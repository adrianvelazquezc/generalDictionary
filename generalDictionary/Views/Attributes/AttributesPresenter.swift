//
//  AttributesPresenter.swift
//  generalDictionary
//
//  Created by Mac on 09/01/23.
//

import Foundation

class AttributesPresenter {
    var interactor: AttributesInteractorProtocol?
    weak var view: AttributesViewProtocol?
    var router: AttributesRouterProtocol?
}



extension AttributesPresenter: AttributesPresenterProtocol {
    
}
