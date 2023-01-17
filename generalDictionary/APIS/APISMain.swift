//
//  APISMain.swift
//  generalDictionary
//
//  Created by Mac on 16/01/23.
//

import Foundation
import UIKit

open class APISMain{
    public static func createModule(navigation: UINavigationController, vcTitle: String) -> UIViewController {
        let viewController: APISView? = APISView()
        if let view = viewController {
            let presenter = APISPresenter()
            let router = APISRouter()
            let interactor = APISInteractor()
            
            view.presenter = presenter
            
            presenter.view = view
            presenter.interactor = interactor
            presenter.router = router
            
            router.navigation = navigation
            
            interactor.presenter = presenter
            return view
        }
        return UIViewController()
    }
}
