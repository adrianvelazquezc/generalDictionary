//
//  DeclarationsMain.swift
//  generalDictionary
//
//  Created by Mac on 09/01/23.
//

import Foundation
import UIKit

open class DeclarationsMain{
    public static func createModule(navigation: UINavigationController, vcTitle: String) -> UIViewController {
        let viewController: DeclarationsView? = DeclarationsView()
        if let view = viewController {
            let presenter = DeclarationsPresenter()
            let router = DeclarationsRouter()
            let interactor = DeclarationsInteractor()
            
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
