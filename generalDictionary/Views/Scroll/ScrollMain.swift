//
//  ScrollMain.swift
//  generalDictionary
//
//  Created by Mac on 06/01/23.
//

import Foundation
import UIKit

open class ScrollMain{
    public static func createModule(navigation: UINavigationController,  vcTitle: String) -> UIViewController {
        let viewController: ScrollView? = ScrollView()
        if let view = viewController {
            let presenter = ScrollPresenter()
            let router = ScrollRouter()
            let interactor = ScrollInteractor()
            
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
