//
//  AppDelegateView.swift
//  generalDictionary
//
//  Created by Mac on 05/01/23.
//

import Foundation
import UIKit

class AppDelegateView: UIViewController {
    var presenter: AppDelegatePresenterProtocol?
    private var ui: AppDelegateViewUI?
    internal var vcTitle: String?

    
    override func loadView() {
        ui = AppDelegateViewUI(
            navigation: self.navigationController!,
            delegate: self
        )
        view = ui
    }
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        .darkContent
//    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.title = vcTitle
        self.navigationController?.navigationBar.standardAppearance.titleTextAttributes = [.foregroundColor: UIColor.link]
        self.navigationController?.isNavigationBarHidden = false
    }
}

extension AppDelegateView: AppDelegateViewProtocol {
    
}

extension AppDelegateView: AppDelegateViewUIDelegate {
    
}
