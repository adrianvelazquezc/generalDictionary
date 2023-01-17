//
//  SecondApiViewUI.swift
//  generalDictionary
//
//  Created by Mac on 17/01/23.
//

import Foundation
import UIKit

protocol SecondApiViewUIDelegate {
    
}

class SecondApiViewUI: UIView{
    var delegate: SecondApiViewUIDelegate?
    var navigationController: UINavigationController?
    var namePokemon = ""
    var heightPokemon = ""
    var weightPokemon = ""
    var numberPokemonLabel = ""
    var pokemonType1: [String] = []
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    private lazy var exampleImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    public convenience init(
        navigation: UINavigationController,
        delegate: SecondApiViewUIDelegate){
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
        self.addSubview(exampleImage)
    }
    func upgradeInfo(pokemon: PokemonDetailResponse){
        self.namePokemon = pokemon.name ?? ""
        self.heightPokemon = self.changeFTToCentimetros(height: pokemon.height ?? 0)
        self.weightPokemon = self.changeLBToKilo(weight: pokemon.weight ?? 0)
        self.numberPokemonLabel = "\(pokemon.id ?? 0)"
        for values in 0..<((pokemon.types?.count ?? 0)) {
                self.pokemonType1.append(pokemon.types?[values].type?.name ?? "")
        }
        self.infoLabel.text = "Tu pokemon se llama \(self.namePokemon), pesa \(self.weightPokemon), mide \(self.heightPokemon) de alto, su numero de la pokedex es: \(self.numberPokemonLabel), ademas es de tipo \(self.pokemonType1)"
        
        if let url = URL(string: pokemon.sprites?.front_default ?? ""){
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.exampleImage.image = UIImage(data: data)
                }
            }
        }
    }
    
    private func changeFTToCentimetros(height: Float)->String{
        let parse = height * 10
        return "\(parse) cm"
    }
    
    private func changeLBToKilo(weight: Float)->String{
        let parse = weight / 10
        return "\(parse) kg"
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            exampleImage.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 50),
            exampleImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            exampleImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            exampleImage.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -100),
        ])
    }
}
