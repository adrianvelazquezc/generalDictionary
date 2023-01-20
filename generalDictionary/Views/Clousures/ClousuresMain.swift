//
//  ClousuresMain.swift
//  generalDictionary
//
//  Created by Mac on 19/01/23.
//

import Foundation
import UIKit

open class ClousuresMain{
    public static func createModule(navigation: UINavigationController, vcTitle: String) -> UIViewController {
        let viewController: ClousuresView? = ClousuresView()
        if let view = viewController {
            let presenter = ClousuresPresenter()
            let router = ClousuresRouter()
            let interactor = ClousuresInteractor()
            
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
