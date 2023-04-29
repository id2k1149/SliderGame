//
//  SliderView.swift
//  SliderGame
//
//  Created by Max Franz Immelmann on 4/28/23.
//

import SwiftUI

struct SliderView: UIViewRepresentable {
    @Binding var sliderValue: Float
    @Binding var targetValue: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.value = sliderValue
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.thumbTintColor = UIColor.red
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderValueChanged),
            for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(sliderValue)
        let alphaComponent = (100 - abs(Float(targetValue) - uiView.value)) / 100
        uiView.thumbTintColor = UIColor.red.withAlphaComponent(CGFloat(alphaComponent))
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(sliderValue: $sliderValue)
    }
}

extension SliderView {
    class Coordinator: NSObject {
        @Binding var sliderValue: Float
        
        init(sliderValue: Binding<Float>) {
            self._sliderValue = sliderValue
        }
        
        @objc func sliderValueChanged(_ sender: UISlider) {
            sliderValue = sender.value
        }
    }
}

struct Slider_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(sliderValue: .constant(50.0),
                   targetValue: .constant(50))
    }
}
