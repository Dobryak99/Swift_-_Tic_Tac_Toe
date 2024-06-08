//
//  BoardView.swift
//  Tic-Tac-Toe
//
//  Created by Никита Журавлев on 01.06.2024.
//

import UIKit

class BoardView: UIStackView{
    
    //Массив кнопок
    private var buttons = [UIButton]()
    
    //Замыкание при нажатии кнопки на поле
    var buttonTappedHandler: ((Int) -> Void)?
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupBoard()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBoard()
    }
    
    init(){
        super.init(frame: .zero)
        
        setupBoard()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection){
            
            if traitCollection.userInterfaceStyle == .dark{
                self.backgroundColor = .white
            }else{
                self.backgroundColor = .black
            }
            
            for button in buttons{
                if traitCollection.userInterfaceStyle == .dark{
                    button.setTitleColor(.white, for: .normal)
                    button.backgroundColor = .black
                }else{
                    button.setTitleColor(.black, for: .normal)
                    button.backgroundColor = .white
                }
            }
            
            for stack in self.arrangedSubviews{
                if traitCollection.userInterfaceStyle == .dark{
                    stack.backgroundColor = .white
                }else{
                    stack.backgroundColor = .black
                }
            }
        }
        
    }
    
    private func setupBoard(){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.distribution = .fillEqually
        self.spacing = 10
        if traitCollection.userInterfaceStyle == .dark{
            self.backgroundColor = .white
        }else{
            self.backgroundColor = .black
        }
        
        for _ in 0..<3{
            let rowStack = UIStackView()
            rowStack.translatesAutoresizingMaskIntoConstraints = false
            rowStack.axis = .horizontal
            rowStack.distribution = .fillEqually
            rowStack.spacing = 10
            
            if traitCollection.userInterfaceStyle == .dark{
                rowStack.backgroundColor = .white
            }else{
                rowStack.backgroundColor = .black
            }
            
            for _ in 0..<3{
                let button = UIButton(type: .custom)
                if traitCollection.userInterfaceStyle == .dark{
                    button.setTitleColor(.white, for: .normal)
                    button.backgroundColor = .black
                }else{
                    button.setTitleColor(.black, for: .normal)
                    button.backgroundColor = .white
                }
                button.setTitle("", for: .normal)
                button.titleLabel?.font = UIFont(name: Font.Manrope_Bold.rawValue, size: 70)
                button.addTarget(self, action: #selector(cellButttonTapped(_:)), for: .touchUpInside)
                rowStack.addArrangedSubview(button)
                buttons.append(button)
            }
            self.addArrangedSubview(rowStack)
        }
        
    }
    
    
    @objc func cellButttonTapped(_ sender: UIButton){
        //Находим индеекс нажатой кнопки
        if let index = buttons.firstIndex(of: sender){
            //вызываем замыкание с этим индексом
            buttonTappedHandler?(index)
        }
    }
    
    func updateButton(at index: Int, with title: String){
        buttons[index].setTitle(title, for: .normal)
        buttons[index].isEnabled = false
    }
    
    func reset(){
        for button in buttons{
            button.setTitle("", for: .normal)
            button.isEnabled = true
        }
    }
    
}
