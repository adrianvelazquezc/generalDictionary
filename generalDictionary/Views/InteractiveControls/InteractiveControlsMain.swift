//
//  InteractiveControlsMain.swift
//  generalDictionary
//
//  Created by Mac on 06/01/23.
//

import Foundation
import UIKit

open class InteractiveControlsMain{
    public static func createModule(navigation: UINavigationController, vcTitle: String) -> UIViewController {
        let viewController: InteractiveControlsView? = InteractiveControlsView()
        if let view = viewController {
            let presenter = InteractiveControlsPresenter()
            let router = InteractiveControlsRouter()
            let interactor = InteractiveControlsInteractor()
            
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
