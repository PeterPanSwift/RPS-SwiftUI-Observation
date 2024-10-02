//
//  Move.swift
//  Demo
//
//  Created by SHIH-YING PAN on 2024/10/2.
//

enum Move: String, CaseIterable, Identifiable {
    case rock = "石頭"
    case paper = "布"
    case scissors = "剪刀"
    
    var id: String { self.rawValue }
    
    var imageName: String {
        switch self {
        case .rock:
            return "rock"
        case .paper:
            return "paper"
        case .scissors:
            return "scissors"
        }
    }
}
