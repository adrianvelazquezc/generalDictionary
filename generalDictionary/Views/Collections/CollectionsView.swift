//
//  CollectionsView.swift
//  generalDictionary
//
//  Created by Mac on 09/01/23.
//

import Foundation
import UIKit

class CollectionsView: UIViewController {
    var presenter: CollectionsPresenterProtocol?
    private var ui: CollectionsViewUI?
    internal var vcTitle: String?
    
    override func loadView() {
        ui = CollectionsViewUI(
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

extension CollectionsView: CollectionsViewProtocol {
    
}

extension CollectionsView: CollectionsViewUIDelegate {
    
}
