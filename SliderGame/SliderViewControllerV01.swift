//
//  ViewController.swift
//  Slider
//
//  Created by Max Franz Immelmann on 4/27/23.
//

import SwiftUI

class SliderViewControllerV01: UIViewController {
    let slider = UISlider()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSlider()
    }
    
    private func setupSlider() {
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.value = 0
        
        slider.frame = CGRect(x: 50, y: 100, width: 200, height: 30)
        
        slider.thumbTintColor = UIColor.red.withAlphaComponent(0.5)
        
        slider.addTarget(self,
                         action: #selector(sliderValueChanged(_:)),
                         for: .valueChanged)
        
        view.addSubview(slider)
        
        let minLabel = UILabel(frame: CGRect(x: 10, y: 100, width: 30, height: 30))
        minLabel.text = "\(Int(slider.minimumValue))"
        view.addSubview(minLabel)
        
        let maxLabel = UILabel(frame: CGRect(x: 260, y: 100, width: 30, height: 30))
        maxLabel.text = "\(Int(slider.maximumValue))"
        view.addSubview(maxLabel)
        
    }
    
    @objc func sliderValueChanged(_ sender: UISlider) {
        print("Slider value changed to: \(sender.value)")
    }
}

/*
struct SliderViewControllerRepresentation: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        return SliderViewControllerV01
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        <#code#>
    }
}
 */

