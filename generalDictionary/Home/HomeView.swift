//
//  HomeView.swift
//  generalDictionary
//
//  Created by Mac on 05/01/23.
//

import Foundation
import UIKit

class HomeView: UIViewController {
    var presenter: HomePresenterProtocol?
    private var ui: HomeViewUI?
    private var currentStatusBarStyle: UIStatusBarStyle = .darkContent
    
    override func loadView() {
        ui = HomeViewUI(
            navigation: self.navigationController!,
            delegate: self
        )
        view = ui
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //se oculto la barra de navegacion
        self.navigationController?.isNavigationBarHidden = true
//        self.changeStatusBarStyle(currentStatusBarStyle)
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        currentStatusBarStyle
    }
    func changeStatusBarStyle(_ style: UIStatusBarStyle){
        self.currentStatusBarStyle = style
        self.setNeedsStatusBarAppearanceUpdate()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
}

extension HomeView: HomeViewProtocol {
    
}

extension HomeView: HomeViewUIDelegate {
    func gotoView(view: List) {
        self.presenter?.requestNextView(view: view)
    }
    
    
}
