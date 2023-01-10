//
//  exampleCollectionCell.swift
//  generalDictionary
//
//  Created by Mac on 09/01/23.
//

import UIKit

internal class exampleCollectionCell: UICollectionViewCell {
    
    
    private lazy var containerMain: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    public var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    public var subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    public static let identifier: String = "exampleCollectionCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUIElements()
        setupConstraints()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUIElements() {
        self.addSubview(containerMain)
        containerMain.addSubview(titleLabel)
        containerMain.addSubview(subtitleLabel)
    }
    
    fileprivate func setupConstraints() {
        NSLayoutConstraint.activate([
            containerMain.topAnchor.constraint(equalTo: topAnchor),
            containerMain.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerMain.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: containerMain.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: containerMain.leadingAnchor, constant: 25),
            titleLabel.trailingAnchor.constraint(equalTo: containerMain.trailingAnchor, constant: -15),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            subtitleLabel.leadingAnchor.constraint(equalTo: containerMain.leadingAnchor, constant: 25),
            subtitleLabel.trailingAnchor.constraint(equalTo: containerMain.trailingAnchor, constant: -15),
            subtitleLabel.bottomAnchor.constraint(equalTo: containerMain.bottomAnchor, constant: -20)
        ])
    }
}
