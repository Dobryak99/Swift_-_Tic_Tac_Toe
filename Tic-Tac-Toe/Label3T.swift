//
//  File.swift
//  Tic-Tac-Toe
//
//  Created by Никита Журавлев on 21.05.2024.
//

import UIKit


class Label3T: UILabel{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(text: String, font: Font, size: CGFloat){
        super.init(frame: .zero)
        self.text = text
        self.textColor = .label
        if let font = UIFont(name: font.rawValue, size: size){
            self.font = font
        }else{
            self.font = UIFont.systemFont(ofSize: size)
        }
        self.textAlignment = .center
        self.numberOfLines = 0
        self.translatesAutoresizingMaskIntoConstraints = false
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.5
        self.numberOfLines = 0
        self.lineBreakMode = .byClipping
    }
    
}
