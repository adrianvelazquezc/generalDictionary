//
//  ControllersMain.swift
//  generalDictionary
//
//  Created by Mac on 06/01/23.
//

import Foundation
import UIKit

open class ControllersMain{
    public static func createModule(navigation: UINavigationController, vcTitle: String) -> UIViewController {
        let viewController: ControllersView? = ControllersView()
        if let view = viewController {
            let presenter = ControllersPresenter()
            let router = ControllersRouter()
            let interactor = ControllersInteractor()
            
            view.presenter = presenter
            view.vcTitle = vcTitle
            
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
