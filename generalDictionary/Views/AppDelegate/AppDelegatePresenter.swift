//
//  AppDelegatePresenter.swift
//  generalDictionary
//
//  Created by Mac on 05/01/23.
//

import Foundation

class AppDelegatePresenter {
    var interactor: AppDelegateInteractorProtocol?
    weak var view: AppDelegateViewProtocol?
    var router: AppDelegateRouterProtocol?
}



extension AppDelegatePresenter: AppDelegatePresenterProtocol {
    
}
