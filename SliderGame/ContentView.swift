//
//  ContentView.swift
//  SliderGame
//
//  Created by Max Franz Immelmann on 4/27/23.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue: Float = 0.0
    @State private var targetValue = Int.random(in: 0...100)
    @State private var showAlert = false
    
    var body: some View {
        
        VStack(spacing: 32) {
            HStack {
                Text("Подвинь слайдер, как можно ближе к: ")
                Text("\(targetValue)")
                    .fixedSize(horizontal: true,
                               vertical: false)
                    .frame(width: 32)
            }
            
            HStack {
                Text("0")
                SliderView(sliderValue: $currentValue,
                           targetValue: $targetValue)
                Text("100")
            }
                
            Button("Проверь меня!") {
                showAlert = true
            }
            .alert(isPresented: $showAlert) {
                let message = computeScore().formatted()
            
                return Alert(
                    title: Text("Your Score"),
                    message: Text(message)
                )
            }
            Button("Начать заново!") {
                targetValue = Int.random(in: 0...100)
            }
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lrintf(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
