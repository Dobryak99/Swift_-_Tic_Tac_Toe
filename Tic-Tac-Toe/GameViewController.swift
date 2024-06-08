//
//  GameViewController.swift
//  Tic-Tac-Toe
//
//  Created by Никита Журавлев on 22.05.2024.
//

import UIKit

class GameViewController: UIViewController {
    
    
    //MARK: - Variables
    var XScore = 0
    var OScore = 0
    
    let homeButton = ActionButton(buttonType: .homeGameMenu)
    let restartButton = ActionButton(buttonType: .restartButton)
    let musicButton = ActionButton(buttonType: .musicGameMenu)
    let stackOfButtons = UIStackView()
    let scoreLabel = Label3T(text: "0 : 0", font: .Manrope_SemiBold, size: 30)
    let playerLabel = Label3T(text: "Player: X", font: .Manrope_SemiBold, size: 30)
    let XLabel = Label3T(text: "X", font: .Manrope_Bold, size: 40)
    let OLabel = Label3T(text: "O", font: .Manrope_Bold, size: 40)
    var model = BoardLogic()
    let boardView = BoardView()
    
    
    
    //MARK: - Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        setView()
        setButtons()
        setLabels()
        setBoard()
    }
    
    //Responsible for changes in appearance (dark or light)
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        // check for theme change
        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection){
            setLabels()
        }
        
    }
    
    private func setView(){
        view.backgroundColor = .systemBackground
        navigationItem.hidesBackButton = true
    }
    
    private func setButtons(){
        
        stackOfButtons.axis = .horizontal
        stackOfButtons.alignment = .center
        stackOfButtons.distribution = .fillEqually
        stackOfButtons.spacing = 35
        stackOfButtons.translatesAutoresizingMaskIntoConstraints = false
        
        stackOfButtons.addArrangedSubview(homeButton)
        stackOfButtons.addArrangedSubview(restartButton)
        stackOfButtons.addArrangedSubview(musicButton)
        
        view.addSubview(stackOfButtons)
        
        homeButton.addTarget(self, action: #selector(popGameVC), for: .touchUpInside)
        restartButton.addTarget(self, action: #selector(restart), for: .touchUpInside)
        musicButton.addTarget(self, action: #selector(musicButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            stackOfButtons.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            stackOfButtons.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 55),
            stackOfButtons.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -55),
            stackOfButtons.heightAnchor.constraint(equalToConstant: 65)
            
        ])
    }
    
    private func setLabels(){
            
        view.addSubview(scoreLabel)
        view.addSubview(playerLabel)
        view.addSubview(XLabel)
        view.addSubview(OLabel)
        
        playerLabel.layer.cornerRadius = 15
        playerLabel.layer.masksToBounds = true
        scoreLabel.layer.cornerRadius = 15
        scoreLabel.layer.masksToBounds = true
        
        if traitCollection.userInterfaceStyle == .dark{
            scoreLabel.backgroundColor = .white
            scoreLabel.textColor = .black
            playerLabel.backgroundColor = .white
            playerLabel.textColor = .black
        }else{
            scoreLabel.backgroundColor = .black
            scoreLabel.textColor = .white
            playerLabel.backgroundColor = .black
            playerLabel.textColor = .white
        }
        
        
        NSLayoutConstraint.activate([
            scoreLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            scoreLabel.widthAnchor.constraint(equalToConstant: 120),
            scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scoreLabel.heightAnchor.constraint(equalToConstant: 50),
            
            playerLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 10),
            playerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playerLabel.widthAnchor.constraint(equalToConstant: 160),
            playerLabel.heightAnchor.constraint(equalToConstant: 50),
            
            XLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            XLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            XLabel.heightAnchor.constraint(equalToConstant: 50),
            XLabel.widthAnchor.constraint(equalToConstant: 50),
            
            OLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            OLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            OLabel.heightAnchor.constraint(equalToConstant: 50),
            OLabel.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setBoard(){
        
        view.addSubview(boardView)
        
        boardView.buttonTappedHandler = handleButtonTapped(at:)
        
        NSLayoutConstraint.activate([
            boardView.topAnchor.constraint(equalTo: playerLabel.bottomAnchor, constant: 50),
            boardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            boardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            boardView.bottomAnchor.constraint(equalTo: stackOfButtons.topAnchor, constant: -50)
        ])
        
    }
    
    private func handleButtonTapped(at index: Int){
        guard model.makeMove(at: index) else {return}
        
        let playerSymbol = model.currentPlayer.rawValue
        boardView.updateButton(at: index, with: playerSymbol)
        model.currentPlayer = model.currentPlayer.next
        
        if model.isGameOver{
            showAlert()
            model.reset()
            boardView.reset()
        }
        playerLabel.text = "Player: \(model.currentPlayer.rawValue)"
        
    }
    
    private func showAlert(){
        let message: String
        
        if let winner = model.winner{
            if winner == .x{
                XScore += 1
                message = "X wins!"
            }else{
                OScore += 1
                message = "O wins!"
            }
        }else{
            message = "It's a draw!"
        }
        
        scoreLabel.text = "\(XScore) : \(OScore)"
        
        let alert = UIAlertController(title: "Game Over", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    @objc private func restart(){
        
        let message = "Are you sure? All game progress will be erased!"
        
        let alert = UIAlertController(title: "Restart", message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.model.reset()
            self.boardView.reset()
            self.playerLabel.text = "Player: \(self.model.currentPlayer.rawValue)"
            self.XScore = 0
            self.OScore = 0
            self.scoreLabel.text = "\(self.XScore) : \(self.OScore)"
        })
        
        alert.addAction(cancelAction)
        alert.addAction(OKAction)
        
        present(alert, animated: true)
    }
    
    @objc private func popGameVC(){        
        navigationController?.popViewController(animated: true)
    }
    
    @objc func musicButtonTapped(){
        if MusicPlayer.shared.isPlaying(){
            MusicPlayer.shared.pauseMusic()
            musicButton.changeImage(to: .musicGameMenuOff)
        }else{
            MusicPlayer.shared.playMusic()
            musicButton.changeImage(to: .musicGameMenu)
        }
    }

    

}
