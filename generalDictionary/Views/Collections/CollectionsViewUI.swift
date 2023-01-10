//
//  CollectionsViewUI.swift
//  generalDictionary
//
//  Created by Mac on 09/01/23.
//

import Foundation
import UIKit

protocol CollectionsViewUIDelegate {
    
}

class CollectionsViewUI: UIView{
    var delegate: CollectionsViewUIDelegate?
    var navigationController: UINavigationController?
    
    var elementsTitle: [String] = []
    var elementsSubtitle: [String] = []
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = "El CollectionView es un control que nos permite mostrar una lista de datos. Es muy similar al ListView pero este control mejora el rendimiento y la gestión de memoria de la lista y proporciona diferentes layouts tales como: Vertical, horizontal y cuadrícula (Grid), lo que lo hace mucho mejor y más rápido nuestro tiempo de desarrollo."
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private lazy var exampleCollection: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        collectionView.backgroundColor = .clear
        collectionView.collectionViewLayout = UICollectionViewFlowLayout.init()
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(exampleCollectionCell.self, forCellWithReuseIdentifier: exampleCollectionCell.identifier)
        return collectionView
    }()
    
    public convenience init(
        navigation: UINavigationController,
        delegate: CollectionsViewUIDelegate){
            self.init()
            self.delegate = delegate
            self.navigationController = navigation
            
            for arrayValues in 1...20 {
                elementsTitle.append("Titulo\(arrayValues)")
                elementsSubtitle.append("Subtitulo\(arrayValues)")
            }
            
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
        self.addSubview(exampleCollection)
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            exampleCollection.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 20),
            exampleCollection.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            exampleCollection.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            exampleCollection.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

extension CollectionsViewUI: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        elementsTitle.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collection = collectionView.dequeueReusableCell(withReuseIdentifier: exampleCollectionCell.identifier, for: indexPath) as! exampleCollectionCell
        collection.titleLabel.text = elementsTitle[indexPath.row]
        collection.subtitleLabel.text = elementsSubtitle[indexPath.row]
        return collection
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width   = exampleCollection.frame.width/3 + 20
        let height  = UIScreen.main.bounds.height < 667 ? 100.0 : 124.0
        
        return CGSize(width: width, height: height)
    }
    
    
}
