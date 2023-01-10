//
//  TablesView.swift
//  generalDictionary
//
//  Created by Mac on 09/01/23.
//

import Foundation
import UIKit

class TablesView: UIViewController {
    var presenter: TablesPresenterProtocol?
    private var ui: TablesViewUI?
    internal var vcTitle: String?
    
    override func loadView() {
        ui = TablesViewUI(
            navigation: self.navigationController!,
            delegate: self
        )
        view = ui
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.navigationBar.standardAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        self.title = vcTitle
        self.navigationController?.isNavigationBarHidden = false
    }
}

extension TablesView: TablesViewProtocol {
    
}

extension TablesView: TablesViewUIDelegate {
    
}
