//
//  InteractiveControlsPresenter.swift
//  generalDictionary
//
//  Created by Mac on 06/01/23.
//

import Foundation

class InteractiveControlsPresenter {
    var interactor: InteractiveControlsInteractorProtocol?
    weak var view: InteractiveControlsViewProtocol?
    var router: InteractiveControlsRouterProtocol?
}



extension InteractiveControlsPresenter: InteractiveControlsPresenterProtocol {
    
}
