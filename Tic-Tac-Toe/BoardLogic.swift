//
//  BoardLogic.swift
//  Tic-Tac-Toe
//
//  Created by Никита Журавлев on 01.06.2024.
//

import Foundation

enum Player: String{
    case x = "X"
    case o = "O"
    
    var next: Player{
        return self == .x ? .o : .x
    }
}


struct BoardLogic{
    
    private var board : [Player?]
    var currentPlayer: Player
    var isGameOver: Bool
    var winner: Player?
    
    init(){
        board = Array(repeating: nil, count: 9)
        currentPlayer = .x
        isGameOver = false
        winner = nil
    }
    
    mutating func makeMove(at index: Int) -> Bool{
        guard index >= 0 && index <= 9 && !isGameOver && board[index] == nil else {
            return false
        }
        board[index] = currentPlayer
        
        if checkWin(){
            isGameOver = true
            winner = currentPlayer
        }else if board.allSatisfy({$0 != nil}){
            isGameOver = true
        }
        
        return true
        
    }
    
    private func checkWin() -> Bool{
        
        let winPatterns: [[Int]] = [
            [0,1,2], [3,4,5], [6,7,8],  //Rows
            [0,3,6], [1,4,7], [2,5,8],  //Cols
            [0,4,8], [2,4,6]            //Diagonals
        ]
        
        for pattern in winPatterns {
            if let player = board[pattern[0]], player == board[pattern[1]], player == board[pattern[2]]{
                return true
            }
        }
        
        return false
    }
    
    mutating func reset(){
        self.board = Array(repeating: nil, count: 9)
        self.currentPlayer = .x
        self.isGameOver = false
        self.winner = nil
    }
    
}
