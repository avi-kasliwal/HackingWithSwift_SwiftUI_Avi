//
//  ContentView.swift
//  GuessTheCoin
//
//  Created by Avi Kasliwal on 18/09/22.
//

import SwiftUI

struct ContentView: View {
    @State private var coins = COINS.shuffled()
    @State private var questionCoinIdx = Int.random(in: 0...2)
    
    @State private var score = 0
    @State private var lives: Int = 3
    @State private var result: String = "PICK YOUR OPTION"
    
    @State private var gamerOverShown = false
    
    let SIZE: CGFloat = 100
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.95, green: 0.67, blue: 0.30), location: 0.3),
                .init(color: Color(red: 0.06, green: 0.09, blue: 0.13), location: 0.3)
            ], center: .top, startRadius: 100, endRadius: 700)
            .ignoresSafeArea()
            
            VStack () {
                // Stats
                HStack {
                    Text ("SCORE: \(score)")
                        .font(.headline)
                        .fontWeight(.bold)
                    Spacer ()
                    
                    // Lives Lost
                    ForEach(0..<(3 - lives), id: \.self) { _ in
                        Image (systemName: "heart")
                    }
                    
                    // Lives Left
                    ForEach(0..<lives, id: \.self) { _ in
                        Image (systemName: "heart.fill")
                    }
                }
                
                Group {
                    Spacer ()
                    Spacer ()
                }
                
                // Question
                VStack (spacing: 10) {
                    Text ("TAP THE LOGO OF")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text ("\(coins [questionCoinIdx])")
                        .font(.title)
                        .fontWeight(.bold)
                }
                
                Group {
                    Spacer ()
                    Spacer ()
                }
                
                // Options
                VStack (spacing: 20) {
                    
                    ForEach (0..<3) { number in
                        Button {
                            coinPressed(number)
                        } label: {
                            Image("\(coins [number])")
                                .resizable()
                                .frame(width: SIZE, height: SIZE)
                                .shadow(color: .gray, radius: 10)
                                .padding(20)
                        }
                        .background(.ultraThinMaterial)
                        .clipShape(Circle())
                    }
                }
                
                Group {
                    Spacer ()
                    Spacer ()
                }
                
                // Result
                VStack {
                    Text ("\(result)")
                        .foregroundColor(Color(red: 0.95, green: 0.67, blue: 0.30))
                        .font(.title)
                        .fontWeight(.bold)
                }
                
                Spacer ()
            }
            .padding(.horizontal, 10)
        }
        .alert("Game Over", isPresented: $gamerOverShown) {
            HStack {
                Button("Continue") {
                    lives = 3
                    score = 0
                    nextQuestion()
                }
                
                Button ("Quit", role: .destructive) {
                    // Close
                    exit (-1)
                }
            }
        } message: {
            Text("Your score is \(score)")
        }
    }
    
    // Update Score, Lives ans Result Text
    func coinPressed (_ number: Int) {
        if questionCoinIdx == number {
            result = "CORRECT :)"
            score += 1
        } else {
            result = "WRONG :("
            lives -= 1
        }
        
        // Ask next question after 1 second
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            result = "PICK YUOR OPTION"
            
            if lives > 0 {
                nextQuestion()
            } else {
                gamerOverShown = true
            }
        }
    }
    
    // Ask next question
    func nextQuestion () {
        coins = coins.shuffled()
        questionCoinIdx = Int.random(in: 0...2)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
