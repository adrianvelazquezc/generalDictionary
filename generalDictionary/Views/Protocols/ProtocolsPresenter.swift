//
//  ProtocolsPresenter.swift
//  generalDictionary
//
//  Created by Mac on 09/01/23.
//

import Foundation

class ProtocolsPresenter {
    var interactor: ProtocolsInteractorProtocol?
    weak var view: ProtocolsViewProtocol?
    var router: ProtocolsRouterProtocol?
}



extension ProtocolsPresenter: ProtocolsPresenterProtocol {
    
}
