//
//  AttributesMain.swift
//  generalDictionary
//
//  Created by Mac on 09/01/23.
//

import Foundation
import UIKit

open class AttributesMain{
    public static func createModule(navigation: UINavigationController, vcTitle: String) -> UIViewController {
        let viewController: AttributesView? = AttributesView()
        if let view = viewController {
            let presenter = AttributesPresenter()
            let router = AttributesRouter()
            let interactor = AttributesInteractor()
            
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
