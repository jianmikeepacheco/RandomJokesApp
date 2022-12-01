//
//  CustomLabel.swift
//  RandomJokeApp
//
//  Created by jian.mikee.pacheco on 12/1/22.
//

import UIKit

class CustomLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(text: String) {
        
        super.init(frame: .zero)
        
        numberOfLines = 0 // no limit to number of lines the label can hold
        sizeToFit()
        
        translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
