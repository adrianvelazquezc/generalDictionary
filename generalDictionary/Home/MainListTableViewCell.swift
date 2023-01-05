//
//  MainListTableViewCell.swift
//  generalDictionary
//
//  Created by Mac on 05/01/23.
//

import UIKit

class MainListTableViewCell: UITableViewCell {

    static let identifier = "MainListTableViewCell"
    
    public let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUIElements()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public convenience init(){
        self.init()
        }
    
    fileprivate func setupUIElements() {
        self.addSubview(titleLabel)
    }
    
    fileprivate func setupConstraints() {
        
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            self.titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            self.titleLabel.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
