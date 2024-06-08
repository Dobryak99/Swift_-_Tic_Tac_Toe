//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Никита Журавлев on 19.05.2024.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    //MARK: - Variables
    
    let playButton = ActionButton(buttonType: .playButton)
    let musicButton = ActionButton(buttonType: .musicMainMenu)
    let creditsButton = ActionButton(buttonType: .credits)
    let titleLabel = Label3T(text: "Tic-Tac-Toe", font: .Manrope_ExtraBold, size: 48)
    
    
    
    
    //MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setView()
        setButtons()
        setTitle()
        
        MusicPlayer.shared.playMusic()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if MusicPlayer.shared.isPlaying(){
            musicButton.changeImage(to: .musicMainMenu)
        }else{
            musicButton.changeImage(to: .musicMainMenuOff)
        }
    }
    
    private func setButtons(){
        view.addSubview(playButton)
        view.addSubview(musicButton)
        view.addSubview(creditsButton)
        
        creditsButton.addTarget(self, action: #selector(pushCreditsVC), for: .touchUpInside)
        playButton.addTarget(self, action: #selector(pushGameVC), for: .touchUpInside)
        musicButton.addTarget(self, action: #selector(musicButtonPressed), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            playButton.widthAnchor.constraint(equalToConstant: 150),
            playButton.heightAnchor.constraint(equalToConstant: 60),
            
            musicButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 30),
            musicButton.widthAnchor.constraint(equalTo: playButton.widthAnchor),
            musicButton.heightAnchor.constraint(equalToConstant: 60),
            musicButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            creditsButton.topAnchor.constraint(equalTo: musicButton.bottomAnchor, constant: 30),
            creditsButton.heightAnchor.constraint(equalToConstant: 60),
            creditsButton.widthAnchor.constraint(equalTo: musicButton.widthAnchor),
            creditsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setView(){
        view.backgroundColor = .systemBackground
    }
    
    private func setTitle(){
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }
    
    
    @objc func pushCreditsVC(){
        let creditsVC = CreditsViewController()
        navigationController?.pushViewController(creditsVC, animated: true)
    }
    
    @objc func pushGameVC(){
        let gameVC = GameViewController()
        
        if MusicPlayer.shared.isPlaying(){
            gameVC.musicButton.changeImage(to: .musicGameMenu)
        }else{
            gameVC.musicButton.changeImage(to: .musicGameMenuOff)
        }
        
        navigationController?.pushViewController(gameVC, animated: true)
    }
    
    @objc func musicButtonPressed(){
        
        if MusicPlayer.shared.isPlaying(){
            MusicPlayer.shared.pauseMusic()
            musicButton.changeImage(to: .musicMainMenuOff)
        }else{
            MusicPlayer.shared.playMusic()
            musicButton.changeImage(to: .musicMainMenu)
        }
        
    }
   


}

