//
//  SliderView.swift
//  SliderGame
//
//  Created by Max Franz Immelmann on 4/28/23.
//

import SwiftUI

struct SliderView: UIViewRepresentable {
    @Binding var sliderValue: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.value = Float(sliderValue)
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.thumbTintColor = UIColor.red.withAlphaComponent(1)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(sliderValue)
    }
}

struct Slider_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(sliderValue: .constant(0.0))
    }
}
