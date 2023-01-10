//
//  ControllersViewUI.swift
//  generalDictionary
//
//  Created by Mac on 06/01/23.
//

import Foundation
import UIKit

protocol ControllersViewUIDelegate {
    
}
private enum ControllerName{
    case controlButtom
    case controlLabel
    case controlTextfield
    case controlView
    case controlImage
}

class ControllersViewUI: UIView{
    var delegate: ControllersViewUIDelegate?
    var navigationController: UINavigationController?
    private var currentControl: ControllerName?
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "Son elementos que se muestran visualmente y sirven para que el usuario los vea o interactue con ellos, para comenzar selecciona un control:"
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private lazy var exampleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.isHidden = true
        label.textColor = .black
        return label
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("boton", for: .normal)
        button.backgroundColor = .link
        button.addTarget(self, action:#selector(bottonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var startLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Texto estatico"
        label.isUserInteractionEnabled = true
        label.textColor = .black
        label.tag = 0
        return label
    }()
    private lazy var starView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        view.tag = 1
        return view
    }()
    
    private lazy var viewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "View"
        label.textColor = .black
        return label
    }()
    private lazy var startTextField: UITextField = {
        let textField = UITextField()
        textField.text = "Texto modificable"
        textField.textColor = .black
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        textField.leftViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.tag = 1
        textField.addTarget(self, action:#selector(bottonTapped), for: .touchDown)
        textField.layer.borderWidth = 1
        return textField
    }()
    
    lazy var startImage : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "startImage")
        image.tag = 2
        image.isUserInteractionEnabled = true
        return image
    }()
    private lazy var declatarionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.isHidden = true
        label.textColor = .black
        return label
    }()
    
    public convenience init(
        navigation: UINavigationController,
        delegate: ControllersViewUIDelegate){
            self.init()
            self.delegate = delegate
            self.navigationController = navigation
            
            
            let gestoTap = UITapGestureRecognizer(target: self, action: #selector(dissmisKeyboard(_:)))
            self.addGestureRecognizer(gestoTap)
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(labelClicked(_:)))
            let tap2 = UITapGestureRecognizer(target: self, action: #selector(labelClicked(_:)))
            let tap3 = UITapGestureRecognizer(target: self, action: #selector(labelClicked(_:)))
            startLabel.addGestureRecognizer(tap)
            starView.addGestureRecognizer(tap2)
            startImage.addGestureRecognizer(tap3)
            
            
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
        self.addSubview(exampleLabel)
        self.addSubview(startButton)
        self.addSubview(startLabel)
        self.addSubview(starView)
        starView.addSubview(viewLabel)
        self.addSubview(startTextField)
        self.addSubview(startImage)
        self.addSubview(declatarionLabel)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            self.infoLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            self.infoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.infoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            exampleLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 20),
            exampleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            exampleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            startButton.topAnchor.constraint(equalTo: exampleLabel.bottomAnchor, constant: 20),
            startButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            startButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            startButton.heightAnchor.constraint(equalToConstant: 50),
            
            startLabel.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 20),
            startLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            startLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            startLabel.heightAnchor.constraint(equalToConstant: 50),
            
            starView.topAnchor.constraint(equalTo: startLabel.bottomAnchor, constant: 20),
            starView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            starView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            starView.heightAnchor.constraint(equalToConstant: 50),
            
            viewLabel.centerXAnchor.constraint(equalTo: starView.centerXAnchor),
            viewLabel.centerYAnchor.constraint(equalTo: starView.centerYAnchor),
            
            startTextField.topAnchor.constraint(equalTo: starView.bottomAnchor, constant: 20),
            startTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            startTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            startTextField.heightAnchor.constraint(equalToConstant: 50),
            
            startImage.topAnchor.constraint(equalTo: startTextField.bottomAnchor, constant: 20),
            startImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            startImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            startImage.heightAnchor.constraint(equalToConstant: 80),
            
            declatarionLabel.topAnchor.constraint(equalTo: startImage.bottomAnchor, constant: 20),
            declatarionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            declatarionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            
        ])
    }
    @objc func dissmisKeyboard(_ sender: UITapGestureRecognizer){
        self.endEditing(true)
    }
    
    @objc func bottonTapped(_ sender: UIControl){
        if sender.tag == 0 {
            self.currentControl = .controlButtom
        }
        if sender.tag == 1 {
            self.currentControl = .controlTextfield
        }
        self.endEditing(true)
        electionChosed()
    }
    
    @objc private func labelClicked(_ sender: UITapGestureRecognizer) {
        if sender.view?.tag == 0 {
            self.currentControl = .controlLabel
        }
        if sender.view?.tag == 1 {
            self.currentControl = .controlView
        }
        if sender.view?.tag == 2 {
            self.currentControl = .controlImage
        }
        self.endEditing(true)
        electionChosed()
    }
    private func electionChosed(){
        switch self.currentControl {
        case .controlButtom:
            exampleLabel.text = "Seleccionaste un UIButton el cual es un boton"
            exampleLabel.isHidden = false
            declatarionLabel.text = "\nprivate lazy var nombreDelButton: UIButton = {\nlet button = UIButton() \nbutton.translatesAutoresizingMaskIntoConstraints = false \nbutton.setTitle(”Nombre que llevara el boton”, for: .normal) \nbutton.backgroundColor = .link, for: .touchUpInside) \nreturn button\n}()"
            declatarionLabel.isHidden = false
            break
        case .controlLabel:
            exampleLabel.text = "Seleccionaste un UILabel el cual es un texto"
            exampleLabel.isHidden = false
            declatarionLabel.text = "private lazy var nombreDelLabel: UILabel = {\nlet label = UILabel() \nlabel.translatesAutoresizingMaskIntoConstraints = false \nlabel.textAlignment = .center\nlabel.text = ”Texto estatico”\nlabel.isUserInteractionEnabled = true\nlabel.textColor = .black\nlabel.tag = 0\nreturn label\n}()"
            declatarionLabel.isHidden = false
            break
        case .controlImage:
            exampleLabel.text = "Seleccionaste un UIImageView el cual es una Imagen"
            exampleLabel.isHidden = false
            declatarionLabel.text = "private lazy var nombreDelTextField: UITextField = { \nlet textField = UITextField() \ntextField.text =\n”Texto modificable” \ntextField.textColor = .black \ntextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10)) \ntextField.leftViewMode = .always \ntextField.translatesAutoresizingMaskIntoConstraints = false \ntextField.layer.borderWidth = 1 \nreturn textField\n}()"
            declatarionLabel.isHidden = false
            break
        case .controlTextfield:
            exampleLabel.text = "Seleccionaste un UITextField el cual es un contedor con texto usualmente modificable"
            exampleLabel.isHidden = false
            declatarionLabel.text = "private lazy var nombreDelTextField: UITextField = { \nlet textField = UITextField() \ntextField.text =\n”Texto modificable” \ntextField.textColor = .black \ntextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10)) \ntextField.leftViewMode = .always \ntextField.translatesAutoresizingMaskIntoConstraints = false \ntextField.layer.borderWidth = 1 \nreturn textField\n}()"
            declatarionLabel.isHidden = false
            break
        case .controlView:
            exampleLabel.text = "Seleccionaste un UIView el cual es un Contenedor"
            exampleLabel.isHidden = false
            declatarionLabel.text = "private lazy var nombreDelView: UIView = { \nlet view = UIView() \nview.translatesAutoresizingMaskIntoConstraints = false \nview.backgroundColor = .gray \nview.tag = 1 \nreturn view \n}()"
            declatarionLabel.isHidden = false
            break
        case .none:
            break
        }
        
    }
}
