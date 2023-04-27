//
//  SliderView.swift
//  SliderGame
//
//  Created by Max Franz Immelmann on 4/27/23.
//

import SwiftUI

struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            Text("0")
            Slider(value: $sliderValue, in: 0...100, step: 1)
            Text("100")
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            SliderView(sliderValue: .constant(50))
        }
    }
}
