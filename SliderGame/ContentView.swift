//
//  ContentView.swift
//  SliderGame
//
//  Created by Max Franz Immelmann on 4/27/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 32) {
            HStack {
                Text("Подвинь слайдер, как можно ближе к: ")
                Text("82")
            }
            HStack {
                Text("0")
                Slider(value: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant(10)/*@END_MENU_TOKEN@*/)
                Text("100")
            }
           
            Button("Проверь меня") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
            }
            Button("Начать заново") {
                /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
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
