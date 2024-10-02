//
//  ContentView.swift
//  Demo
//
//  Created by SHIH-YING PAN on 2024/10/2.
//

import SwiftUI

struct ContentView: View {
    private var gameModel = GameModel()
    @State private var showResult = false

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple.opacity(0.6), Color.blue.opacity(0.6)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()

            VStack(spacing: 30) {
                Text("剪刀石頭布")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.white)
                    .shadow(radius: 5)

                Text("請選擇您的出拳")
                    .font(.headline)
                    .foregroundStyle(.white)

                HStack(spacing: 30) {
                    ForEach(Move.allCases) { move in
                        Button(action: {
                            withAnimation {
                                gameModel.play(move: move)
                                showResult = true
                            }
                        }) {
                            Image(move.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .shadow(radius: 5)
                        }
                    }
                }

                if showResult {
                    VStack(spacing: 20) {
                        HStack(spacing: 50) {
                            VStack {
                                Text("你")
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                Image(gameModel.playerMove?.imageName ?? "")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .shadow(radius: 5)
                            }

                            VStack {
                                Text("電腦")
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                Image(gameModel.computerMove?.imageName ?? "")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .shadow(radius: 5)
                            }
                        }

                        Text(gameModel.resultText)
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(.white)
                            .shadow(radius: 5)

                        Button(action: {
                            withAnimation {
                                gameModel.resetGame()
                                showResult = false
                            }
                        }) {
                            Text("再玩一次")
                                .font(.headline)
                                .foregroundStyle(.white)
                                .padding()
                                .background(Color.green, in: .rect(cornerRadius: 10))
                                .shadow(radius: 5)
                        }
                    }
                    .transition(.scale)
                }
                Spacer()
            }
            .padding()
        }
    }
}


#Preview {
    ContentView()
}
