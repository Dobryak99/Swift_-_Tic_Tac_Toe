//
//  CreditsStackView.swift
//  Tic-Tac-Toe
//
//  Created by Никита Журавлев on 22.05.2024.
//

import UIKit

class CreditsStackView: UIStackView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(){
        super.init(frame: .zero)
        
        self.axis = .vertical
        self.alignment = .center
        self.distribution = .fillEqually
        self.spacing = 5
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    
}
