//
//  SliderView.swift
//  SliderGame
//
//  Created by Max Franz Immelmann on 4/28/23.
//

import SwiftUI

struct SliderView: UIViewRepresentable {
    @Binding var sliderValue: Double
    let alphaComponent: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
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
        uiView.thumbTintColor = UIColor.red.withAlphaComponent(CGFloat(alphaComponent) / 100)
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
            sliderValue = Double(sender.value)
        }
    }
}

struct Slider_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(sliderValue: .constant(75),
                   alphaComponent: 25)
    }
}
