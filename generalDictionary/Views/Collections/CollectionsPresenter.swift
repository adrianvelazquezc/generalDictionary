//
//  CollectionsPresenter.swift
//  generalDictionary
//
//  Created by Mac on 09/01/23.
//

import Foundation

class CollectionsPresenter {
    var interactor: CollectionsInteractorProtocol?
    weak var view: CollectionsViewProtocol?
    var router: CollectionsRouterProtocol?
}



extension CollectionsPresenter: CollectionsPresenterProtocol {
    
}
