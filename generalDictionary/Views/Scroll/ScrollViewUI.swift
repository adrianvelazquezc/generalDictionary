//
//  ScrollViewUI.swift
//  generalDictionary
//
//  Created by Mac on 06/01/23.
//

import Foundation
import UIKit

protocol ScrollViewUIDelegate {
    
}

class ScrollViewUI: UIView{
    var delegate: ScrollViewUIDelegate?
    var navigationController: UINavigationController?
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "ScrollView es una vista capaz de desplazar su contenido. De forma predeterminada, ScrollView desplaza su contenido verticalmente. Un ScrollView solo elemento puede tener un solo elemento secundario, aunque puede ser otros diseños."
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = UIColor.clear
        view.showsHorizontalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var firstContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.yellow
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var exampleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Para definirla, se ocupa primeramente crear un UIScrollView: \n \nprivate lazy var scrollView: UIScrollView = { \nlet view = UIScrollView() \n  view.backgroundColor = UIColor.clear \n  view.showsHorizontalScrollIndicator = false \nv  iew.translatesAutoresizingMaskIntoConstraints = false \nreturn view\n}() \n \n \nDeslizame hacia arriba y abajo para ver como funciono"
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private lazy var declarationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Para definir los constrains, se definen como cualquier otro componente, asignandole constrains, arriba, abajo, izquierda y derecha: \n \nscrollView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor),\nscrollView.leadingAnchor.constraint(equalTo: leadingAnchor), \nscrollView.trailingAnchor.constraint(equalTo: trailingAnchor), \nscrollView.bottomAnchor.constraint(equalTo: bottomAnchor),\n \nAdemas... si hay algun componente que lo desborde hacia los lados, hay que limitarlo, un ejemplo de esto fue como se centraron los contenedores al centro del scroll utilizando: \nnombreDelComponente.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)."
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private lazy var secondContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.brown
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public convenience init(
        navigation: UINavigationController,
        delegate: ScrollViewUIDelegate){
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
        self.addSubview(infoLabel)
        self.addSubview(scrollView)
        self.scrollView.addSubview(firstContainerView)
        self.scrollView.addSubview(exampleLabel)
        self.scrollView.addSubview(secondContainerView)
        self.scrollView.addSubview(declarationLabel)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            self.infoLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            self.infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.infoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            ///ScrollView
            scrollView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            ///Primer contenedor
            firstContainerView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            firstContainerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            firstContainerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            firstContainerView.heightAnchor.constraint(equalToConstant: 300),
            firstContainerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            ///Texto que va en medio
            exampleLabel.topAnchor.constraint(equalTo: firstContainerView.bottomAnchor, constant: 30),
            exampleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            exampleLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            
            ///Segundo contenedor
            secondContainerView.topAnchor.constraint(equalTo: exampleLabel.bottomAnchor, constant: 20),
            secondContainerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            secondContainerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            secondContainerView.heightAnchor.constraint(equalToConstant: 450),
            secondContainerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            declarationLabel.topAnchor.constraint(equalTo: secondContainerView.bottomAnchor, constant: 20),
            declarationLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 10),
            declarationLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -10),
            declarationLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20),
        ])
    }
}
