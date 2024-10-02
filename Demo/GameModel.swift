//
//  GameModel.swift
//  Demo
//
//  Created by SHIH-YING PAN on 2024/10/2.
//


import SwiftUI

@Observable
class GameModel {
    var playerMove: Move?
    var computerMove: Move?    
    var resultText: String = ""
    
    func play(move: Move) {
        playerMove = move
        computerMove = Move.allCases.randomElement()
        determineWinner()
    }
    
    private func determineWinner() {
        if playerMove == computerMove {
            resultText = "平手！"
        } else if (playerMove == .rock && computerMove == .scissors) ||
                    (playerMove == .paper && computerMove == .rock) ||
                    (playerMove == .scissors && computerMove == .paper) {
            resultText = "你贏了！"
        } else {
            resultText = "你輸了！"
        }
    }
    
    func resetGame() {
        playerMove = nil
        computerMove = nil
        resultText = ""
    }
}
