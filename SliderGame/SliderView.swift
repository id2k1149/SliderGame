//
//  SliderView.swift
//  SliderGame
//
//  Created by Max Franz Immelmann on 4/28/23.
//

import SwiftUI

struct SliderView: UIViewRepresentable {
    @Binding var sliderValue: Double
    @Binding var targetValue: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        print("sliderValue = \(sliderValue)")
        slider.value = Float(sliderValue)
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderValueChanged),
            for: .valueChanged)
        
        slider.thumbTintColor = UIColor.red
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(sliderValue)
        print("updatedSliderValue = \(sliderValue)")
        let alphaComponent = (100 - abs(Float(targetValue) - uiView.value)) / 100
        print("alphaComponent = \(alphaComponent)")
        uiView.thumbTintColor = UIColor.red.withAlphaComponent(CGFloat(alphaComponent))
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(sliderValue: $sliderValue)
    }
}

extension SliderView {
    class Coordinator: NSObject {
        @Binding var sliderValue: Double
        
        init(sliderValue: Binding<Double>) {
            self._sliderValue = sliderValue
        }
        
        @objc func sliderValueChanged(_ sender: UISlider) {
            print("Slider value changed to: \(sender.value)")
            sliderValue = Double(sender.value)
            
        }
    }
}

struct Slider_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(sliderValue: .constant(50.0),
                   targetValue: .constant(50))
    }
}
