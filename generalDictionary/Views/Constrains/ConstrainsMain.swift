//
//  ConstrainsMain.swift
//  generalDictionary
//
//  Created by Mac on 06/01/23.
//

import Foundation
import UIKit

open class ConstrainsMain{
    public static func createModule(navigation: UINavigationController, vcTitle: String) -> UIViewController {
        let viewController: ConstrainsView? = ConstrainsView()
        if let view = viewController {
            let presenter = ConstrainsPresenter()
            let router = ConstrainsRouter()
            let interactor = ConstrainsInteractor()
            
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
