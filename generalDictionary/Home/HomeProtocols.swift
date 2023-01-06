//
//  HomeProtocols.swift
//  generalDictionary
//
//  Created by Mac on 05/01/23.
//

import Foundation

protocol HomeViewProtocol: AnyObject {
    
}

protocol HomePresenterProtocol: AnyObject {
    func requestNextView(view: List)
}

protocol HomeRouterProtocol: AnyObject {
    func navigateNextView(view: List)
}
