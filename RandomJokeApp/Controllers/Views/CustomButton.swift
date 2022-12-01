//
//  CustomButton.swift
//  RandomJokeApp
//
//  Created by jian.mikee.pacheco on 11/29/22.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(icon: UIImage?) {
        super.init(frame: .zero)
        
        tintColor = .systemRed
        
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
