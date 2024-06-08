//
//  ActionButton.swift
//  Tic-Tac-Toe
//
//  Created by Никита Журавлев on 21.05.2024.
//

import UIKit



enum Assets: String{
    case credits = "credits_button"
    case homeMainMenu = "home_button"
    case homeGameMenu = "home_playbutton"
    case musicMainMenu = "music_button"
    case musicMainMenuOff = "music_button_off"
    case musicGameMenu = "music_playbutton"
    case musicGameMenuOff = "music_playbutton_off"
    case playButton = "play_button"
    case restartButton = "restart_button"
}


class ActionButton: UIButton{
    
    init(buttonType: Assets){
        super.init(frame: .zero)
        self.setImage(UIImage(named: buttonType.rawValue), for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    func changeImage(to buttonType: Assets){
        self.setImage(UIImage(named: buttonType.rawValue), for: .normal)
    }
    
    
}
