//
//  SavedInfoPresenter.swift
//  generalDictionary
//
//  Created by Mac on 17/01/23.
//

import Foundation

class SavedInfoPresenter {
    var interactor: SavedInfoInteractorProtocol?
    weak var view: SavedInfoViewProtocol?
    var router: SavedInfoRouterProtocol?
}



extension SavedInfoPresenter: SavedInfoPresenterProtocol {
    
}
