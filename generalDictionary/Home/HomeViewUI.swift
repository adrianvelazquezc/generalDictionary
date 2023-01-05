//
//  HomeViewUI.swift
//  generalDictionary
//
//  Created by Mac on 05/01/23.
//

import Foundation
import UIKit

protocol HomeViewUIDelegate {
    
}

class HomeViewUI: UIView{
    var delegate: HomeViewUIDelegate?
    var navigationController: UINavigationController?
    
    public convenience init(
        navigation: UINavigationController,
        delegate: HomeViewUIDelegate){
            self.init()
            self.delegate = delegate
            self.navigationController = navigation
            
            setUI()
            setConstraints()
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUI(){
        self.backgroundColor = .red
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            
        ])
    }
}
