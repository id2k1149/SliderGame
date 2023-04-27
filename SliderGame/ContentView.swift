//
//  ContentView.swift
//  SliderGame
//
//  Created by Max Franz Immelmann on 4/27/23.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValue = 0.0
    @State private var randomValue = Double.random(in: 0...100)
    
    var body: some View {
        
        VStack(spacing: 32) {
            Text("\(lround(sliderValue))")
            
            HStack {
                Text("Подвинь слайдер, как можно ближе к: ")
                Text("\(lround(randomValue))")
            }
            
            SliderView(sliderValue: $sliderValue)
                
            Button("Проверь меня!") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
            Button("Начать заново!") {
                sliderValue = 0.0
                randomValue = Double.random(in: 0...100)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
