//
//  ScrollPresenter.swift
//  generalDictionary
//
//  Created by Mac on 06/01/23.
//

import Foundation

class ScrollPresenter {
    var interactor: ScrollInteractorProtocol?
    weak var view: ScrollViewProtocol?
    var router: ScrollRouterProtocol?
}



extension ScrollPresenter: ScrollPresenterProtocol {
    
}
