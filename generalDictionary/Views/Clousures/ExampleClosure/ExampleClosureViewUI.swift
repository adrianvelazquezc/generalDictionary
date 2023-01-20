//
//  ExampleClosureViewUI.swift
//  generalDictionary
//
//  Created by Mac on 19/01/23.
//

import Foundation
import UIKit

protocol ExampleClosureViewUIDelegate {
    func selectedClosure(closureChoosed: Int)
}

class ExampleClosureViewUI: UIView{
    var delegate: ExampleClosureViewUIDelegate?
    var navigationController: UINavigationController?
    let closureValues = ["uno", "dos", "tres", "cuatro", "cinco"]
    
    private var contentScroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private var exampleLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Selecciona un closure"
        label.textAlignment = .center
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    } ()
    
    
    private var closureSegmentedControl: UISegmentedControl = {
        let control = UISegmentedControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.removeAllSegments()
        
        for (index, value) in ["Closure", "Referido", "Inferido", "Mapa", "Escaping"].enumerated() {
            control.insertSegment(withTitle: value, at: index, animated: true)
        }
        let font = UIFont.systemFont(ofSize: 16)
        control.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
        control.backgroundColor = .gray
        control.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        return control
    }()
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        delegate?.selectedClosure(closureChoosed: closureSegmentedControl.selectedSegmentIndex)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    public convenience init(
        navigation: UINavigationController,
        delegate: ExampleClosureViewUIDelegate){
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
        self.backgroundColor = .white
        self.addSubview(contentScroll)
        contentScroll.addSubview(exampleLable)
        contentScroll.addSubview(closureSegmentedControl)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            contentScroll.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            contentScroll.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentScroll.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentScroll.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            exampleLable.topAnchor.constraint(equalTo: contentScroll.topAnchor),
            exampleLable.leadingAnchor.constraint(equalTo: contentScroll.leadingAnchor),
            exampleLable.trailingAnchor.constraint(equalTo: contentScroll.trailingAnchor),
            exampleLable.centerXAnchor.constraint(equalTo: contentScroll.centerXAnchor),
            
            closureSegmentedControl.topAnchor.constraint(equalTo: exampleLable.bottomAnchor, constant: 30),
            closureSegmentedControl.leadingAnchor.constraint(equalTo: contentScroll.leadingAnchor),
            closureSegmentedControl.trailingAnchor.constraint(equalTo: contentScroll.trailingAnchor),
            closureSegmentedControl.bottomAnchor.constraint(equalTo: contentScroll.bottomAnchor),
            closureSegmentedControl.centerXAnchor.constraint(equalTo: contentScroll.centerXAnchor),
            
        ])
    }
}
