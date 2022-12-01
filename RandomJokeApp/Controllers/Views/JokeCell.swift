//
//  JokeCell.swift
//  RandomJokeApp
//
//  Created by jian.mikee.pacheco on 11/30/22.
//

import UIKit

class JokeCell: UITableViewCell {
    
    let setup = UILabel()
    let punchline = UILabel()
    
    static let reuseIdentifier = "JokeCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup.translatesAutoresizingMaskIntoConstraints = false
        setup.font = .systemFont(ofSize: 15, weight: .medium)
        setup.numberOfLines = 0
        setup.sizeToFit()
        
        punchline.translatesAutoresizingMaskIntoConstraints = false
        punchline.font = .systemFont(ofSize: 15, weight: .regular)
        punchline.numberOfLines = 0
        punchline.sizeToFit()
        
        configureCell()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell() {
        contentView.addSubview(setup)
        contentView.addSubview(punchline)
        
        NSLayoutConstraint.activate([
            setup.topAnchor.constraint(equalTo: contentView.topAnchor),
            setup.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            setup.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            setup.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            punchline.leadingAnchor.constraint(equalTo: setup.leadingAnchor),
            punchline.topAnchor.constraint(equalTo: setup.bottomAnchor),
            punchline.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
        ])
    }
    
}
    



