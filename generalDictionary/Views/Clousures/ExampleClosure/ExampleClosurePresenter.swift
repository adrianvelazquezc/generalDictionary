//
//  ExampleClosurePresenter.swift
//  generalDictionary
//
//  Created by Mac on 19/01/23.
//

import Foundation

class ExampleClosurePresenter {
    var interactor: ExampleClosureInteractorProtocol?
    weak var view: ExampleClosureViewProtocol?
    var router: ExampleClosureRouterProtocol?
}



extension ExampleClosurePresenter: ExampleClosurePresenterProtocol {
    
}
