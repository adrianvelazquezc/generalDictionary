//
//  CollectionsMain.swift
//  generalDictionary
//
//  Created by Mac on 09/01/23.
//

import Foundation
import UIKit

open class CollectionsMain{
    public static func createModule(navigation: UINavigationController, vcTitle: String) -> UIViewController {
        let viewController: CollectionsView? = CollectionsView()
        if let view = viewController {
            let presenter = CollectionsPresenter()
            let router = CollectionsRouter()
            let interactor = CollectionsInteractor()
            
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
