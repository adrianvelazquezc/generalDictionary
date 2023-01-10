//
//  DeclarationsViewUI.swift
//  generalDictionary
//
//  Created by Mac on 09/01/23.
//

import Foundation
import UIKit

protocol DeclarationsViewUIDelegate {
    
}

class DeclarationsViewUI: UIView{
    var delegate: DeclarationsViewUIDelegate?
    var navigationController: UINavigationController?
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = UIColor.clear
        view.showsHorizontalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Constructores \nFunc nombreConstructor(){ \n///Función del constructor \n}"
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private lazy var subInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Funciones \nfunc nombreConstructor(parametro1:Tipo, parametro2:Tipo, parametroN:Tipo){\nprint(parametro1) \nPrint(parametro2) \nprint(parametroN) \nprint( (parametro1)   (parametro2)  (parametroN)) \n}"
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private lazy var tapInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Gestos \nlet nombreDelGesto = UITapGestureRecognizer(target: self, action: #selector(funcionDelGesto(_:))) \nnombreDelGesto.numberOfTapsRequired = 1 \nnombreDelGesto.numberOfTouchesRequired = 1 \ncomponente.addGestureRecognizer(nombreDelGesto) \ncomponente.isUserInteractionEnabled = true \n\n@objc func funcionDelGesto(_ sender: UITapGestureRecognizer){ \nprint(”gesture works”) \n}"
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private lazy var targetInfoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "AddTarget \nbutton.addTarget(self, action:#selector(nombreDeLaFuncionDelBoton), for: .touchUpInside) \nreturn button \n@objc func nombreDeLaFuncionDelBoton(){ \nprint(”aqua ya haces algo”) \n}"
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    public convenience init(
        navigation: UINavigationController,
        delegate: DeclarationsViewUIDelegate){
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
        self.addSubview(scrollView)
        scrollView.addSubview(infoLabel)
        scrollView.addSubview(subInfoLabel)
        scrollView.addSubview(tapInfoLabel)
        scrollView.addSubview(targetInfoLabel)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            self.scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
            self.infoLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            self.infoLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            self.infoLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            self.infoLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            self.subInfoLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 20),
            self.subInfoLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            self.subInfoLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            
            self.tapInfoLabel.topAnchor.constraint(equalTo: subInfoLabel.bottomAnchor, constant: 20),
            self.tapInfoLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            self.tapInfoLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            
            self.targetInfoLabel.topAnchor.constraint(equalTo: tapInfoLabel.bottomAnchor, constant: 20),
            self.targetInfoLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            self.targetInfoLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            self.targetInfoLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 20),
        ])
    }
}
