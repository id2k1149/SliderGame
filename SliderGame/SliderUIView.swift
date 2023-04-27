//
//  SliderUIView.swift
//  SliderGame
//
//  Created by Max Franz Immelmann on 4/27/23.
//

import SwiftUI

struct SliderUIView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        Slider(value: $sliderValue,
               in: 0...100,
               step: 1,
               minimumValueLabel: Text("0"),
               maximumValueLabel: Text("100"),
               label: {
                    Text("Slider")
               })
    }
}

struct SliderUIView_Previews: PreviewProvider {
    static var previews: some View {
        SliderUIView(sliderValue: .constant(50))
    }
}
