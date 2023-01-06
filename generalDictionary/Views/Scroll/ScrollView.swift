//
//  ScrollView.swift
//  generalDictionary
//
//  Created by Mac on 06/01/23.
//

import Foundation
import UIKit

class ScrollView: UIViewController {
    var presenter: ScrollPresenterProtocol?
    private var ui: ScrollViewUI?
    internal var vcTitle: String?
    
    override func loadView() {
        ui = ScrollViewUI(
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

extension ScrollView: ScrollViewProtocol {
    
}

extension ScrollView: ScrollViewUIDelegate {
    
}
