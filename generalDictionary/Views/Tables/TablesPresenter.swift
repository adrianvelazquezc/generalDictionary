//
//  TablesPresenter.swift
//  generalDictionary
//
//  Created by Mac on 09/01/23.
//

import Foundation

class TablesPresenter {
    var interactor: TablesInteractorProtocol?
    weak var view: TablesViewProtocol?
    var router: TablesRouterProtocol?
}



extension TablesPresenter: TablesPresenterProtocol {
    
}
