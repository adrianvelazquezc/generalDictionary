//
//  AppDelegateMain.swift
//  generalDictionary
//
//  Created by Mac on 05/01/23.
//

import Foundation
import UIKit

open class AppDelegateMain{
    public static func createModule(navigation: UINavigationController, vcTitle: String) -> UIViewController {
        let viewController: AppDelegateView? = AppDelegateView()
        if let view = viewController {
            let presenter = AppDelegatePresenter()
            let router = AppDelegateRouter()
            let interactor = AppDelegateInteractor()
            
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
