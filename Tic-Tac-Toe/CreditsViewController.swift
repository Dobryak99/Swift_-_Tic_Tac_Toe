//
//  CreditsViewController.swift
//  Tic-Tac-Toe
//
//  Created by Никита Журавлев on 21.05.2024.
//

import UIKit

class CreditsViewController: UIViewController {

    let homeButton = ActionButton(buttonType: .homeMainMenu)
    let titleLabel = Label3T(text: "Credits", font: .Manrope_ExtraBold, size: 56)
    
    let creditsStack = CreditsStackView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setView()
        setHomeButton()
        setTitleLabel()
        setCreditsStackView()
    }
    
    
    //MARK: - Functions
    private func setView(){
        view.backgroundColor = .systemBackground
        navigationItem.hidesBackButton = true
    }
    
    private func setHomeButton(){
        view.addSubview(homeButton)
        
        homeButton.addTarget(self, action: #selector(popCreditsVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            homeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            homeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
            homeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -120),
            homeButton.heightAnchor.constraint(equalToConstant: 65),
            homeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
    }
    
    private func setTitleLabel(){
        view.addSubview(titleLabel)
        
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setCreditsStackView(){
        view.addSubview(creditsStack)
        
        let musicLabel = Label3T(text: "Music:", font: .Manrope_Bold, size: 32)
        let musicDescrLabel = Label3T(text: "\"Rainy Days\" Sample Pack (Pvlace, Frank Dukes)", font: .Manrope_Regular, size: 25)
        let fontLabel = Label3T(text: "Font:", font: .Manrope_Bold, size: 32)
        let fontDescrLabel = Label3T(text: "Manrope", font: .Manrope_Regular, size: 25)
        let developerLabel = Label3T(text: "Developer:", font: .Manrope_Bold, size: 32)
        let developerDescrLabel = Label3T(text: "Dobryak", font: .Manrope_Regular, size: 25)
        
        creditsStack.addArrangedSubview(musicLabel)
        creditsStack.addArrangedSubview(musicDescrLabel)
        creditsStack.addArrangedSubview(fontLabel)
        creditsStack.addArrangedSubview(fontDescrLabel)
        creditsStack.addArrangedSubview(developerLabel)
        creditsStack.addArrangedSubview(developerDescrLabel)
        
        NSLayoutConstraint.activate([
            creditsStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            creditsStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            creditsStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            creditsStack.bottomAnchor.constraint(equalTo: homeButton.topAnchor, constant: -50)
        ])
    }
    
    @objc func popCreditsVC(){
        navigationController?.popViewController(animated: true)
    }
    
    
    

   
}
