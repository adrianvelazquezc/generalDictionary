//
//  ClousuresViewUI.swift
//  generalDictionary
//
//  Created by Mac on 19/01/23.
//

import Foundation
import UIKit

protocol ClousuresViewUIDelegate {
    func notifyGoExampleView()
}

class ClousuresViewUI: UIView{
    var delegate: ClousuresViewUIDelegate?
    var navigationController: UINavigationController?
    
    private var contentScroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private var exampleLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Texto de ejemplo"
        label.textAlignment = .center
        return label
    } ()
    
    private var closureNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    } ()
    private var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    } ()
    
    private var exampleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    } ()
    
    private var exampleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ir a hacer la prueba", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(example), for: .touchUpInside)
        return button
    }()
    
    @objc func example(_ sender: UIButton){
        delegate?.notifyGoExampleView()
    }
    
    
    func showClosureChoosed(closureChoosed: Int) {
        switch closureChoosed {
        case 0:
            self.closureNameLabel.text = "Elegiste el closure normal \nEl cual se define:"
            self.infoLabel.text = "var closure: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in \nreturn a + b \n}"
            self.exampleLabel.text = "Se implementa de la siguiente manera: \nlet result = closure(1,2) \nprint(result)"
            break
        case 1:
            self.closureNameLabel.text = "Elegiste el closure referido \nEl cual se define:"
            self.infoLabel.text = "var closureInferido = { (a: Int, b: Int) in \nreturn a + b \n}"
            self.exampleLabel.text = "Se implementa de la siguiente manera: \nlet resultInferido = closureInferido(1,2) \nprint(resultInferido)"
            break
        case 2:
            self.closureNameLabel.text = "Elegiste el closure inferido \nEl cual se define:"
            self.infoLabel.text = "let arrayInteger = [1, 2, 3] \nlet resultArrayInferido = arrayInteger.map { numbers in \nnumbers + 1 \n} \nprint(resultArrayInferido)"
            self.exampleLabel.text = "Ademas aqui se puede acortar de la siguiente manera: \n//con esta funcion especifica que a la primera columna de el array ($0) se le sumara 1 \nlet secondArrayInferido = resultArrayInferido.map { $0 + 1 } \nprint(secondArrayInferido)"
            break
        case 3:
            self.closureNameLabel.text = "Elegiste el closure de Mapa \nEl cual se define:"
            self.infoLabel.text = "func mapArray(array: [Int], transform: (Int) -> Int) -> [Int] { \nvar numberArray3: [Int] = [] \nfor item in array { \nnumberArray3.append(transform(item)) \n} \nreturn numberArray3 \n}"
            self.exampleLabel.text = "Se implementa de la siguiente manera: \nlet resultMapArray = mapArray(array: secondArrayInferido) { $0 - 2 } \nprint(resultMapArray)"
            break
        case 4:
            self.closureNameLabel.text = "Elegiste el closure usando @escaping \nEl cual se define:"
            self.infoLabel.text = "func exampleEscaping(attribute1: String, attribut2: Int, completionHandler: @escaping(String, String) -> ()) { \ncompletionHandler(”aqui va un slashInvertida(attribute1), lo segundo insertado fue:  slashInvertida(attribut2)”, ”aqui mostrarias un segundo valor”) \n}"
            self.exampleLabel.text = "Se implementa de la siguiente manera: \nexampleEscaping(attribute1: ”valor”, attribut2: 2) { firstValorReturned, secondValorReturned  in \nprint(firstValorReturned) \nprint(secondValorReturned) \n}"
            break
        default:
            self.closureNameLabel.text = "Parece que hubo un error, elige otra vez"
            break
        }
    }
    
    public convenience init(
        navigation: UINavigationController,
        delegate: ClousuresViewUIDelegate){
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
        contentScroll.addSubview(closureNameLabel)
        contentScroll.addSubview(infoLabel)
        contentScroll.addSubview(exampleLabel)
        contentScroll.addSubview(exampleButton)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            contentScroll.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            contentScroll.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            contentScroll.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            contentScroll.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            exampleLable.topAnchor.constraint(equalTo: contentScroll.topAnchor),
            exampleLable.leadingAnchor.constraint(equalTo: contentScroll.leadingAnchor),
            exampleLable.trailingAnchor.constraint(equalTo: contentScroll.trailingAnchor),
            exampleLable.centerXAnchor.constraint(equalTo: contentScroll.centerXAnchor),
            
            closureNameLabel.topAnchor.constraint(equalTo: exampleLable.bottomAnchor, constant: 30),
            closureNameLabel.leadingAnchor.constraint(equalTo: contentScroll.leadingAnchor),
            closureNameLabel.trailingAnchor.constraint(equalTo: contentScroll.trailingAnchor),
            
            infoLabel.topAnchor.constraint(equalTo: closureNameLabel.bottomAnchor, constant: 30),
            infoLabel.leadingAnchor.constraint(equalTo: contentScroll.leadingAnchor),
            infoLabel.trailingAnchor.constraint(equalTo: contentScroll.trailingAnchor),
            
            exampleLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 30),
            exampleLabel.leadingAnchor.constraint(equalTo: contentScroll.leadingAnchor),
            exampleLabel.trailingAnchor.constraint(equalTo: contentScroll.trailingAnchor),
            
            exampleButton.topAnchor.constraint(equalTo: exampleLabel.bottomAnchor, constant: 30),
            exampleButton.leadingAnchor.constraint(equalTo: contentScroll.leadingAnchor),
            exampleButton.trailingAnchor.constraint(equalTo: contentScroll.trailingAnchor),
            exampleButton.bottomAnchor.constraint(equalTo: contentScroll.bottomAnchor),
            
        ])
    }
}
