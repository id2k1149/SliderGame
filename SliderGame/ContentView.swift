//
//  ContentView.swift
//  SliderGame
//
//  Created by Max Franz Immelmann on 4/27/23.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue = 0.0
    @State private var targetValue = Int.random(in: 0...100)
    
    var body: some View {
        
        VStack(spacing: 32) {
            Text("\(lround(currentValue))")
            
            HStack {
                Text("Подвинь слайдер, как можно ближе к: ")
                Text("\(lround(Double(targetValue)))")
            }
            
            SliderView(sliderValue: $currentValue)
                
            Button("Проверь меня!") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
            Button("Начать заново!") {
                currentValue = 0.0
                targetValue = Int.random(in: 0...100)
            }
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
