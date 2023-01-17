//
//  SecondApiMain.swift
//  generalDictionary
//
//  Created by Mac on 17/01/23.
//

import Foundation
import UIKit

open class SecondApiMain{
    public static func createModule(navigation: UINavigationController, url: String) -> UIViewController {
        let viewController: SecondApiView? = SecondApiView()
        if let view = viewController {
            let presenter = SecondApiPresenter()
            let router = SecondApiRouter()
            let interactor = SecondApiInteractor()
            
            view.presenter = presenter
            
            presenter.view = view
            presenter.interactor = interactor
            presenter.router = router
            
            router.navigation = navigation
            
            interactor.presenter = presenter
            interactor.url = url
            return view
        }
        return UIViewController()
    }
}
