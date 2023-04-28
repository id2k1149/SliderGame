//
//  ViewController.swift
//  SliderUIKit
//
//  Created by Max Franz Immelmann on 4/28/23.
//

import SwiftUI

class SliderViewController: UIViewController {

    @IBOutlet var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSlider()
    }
    
    @IBAction func sliderAction() {
        let alphaComponent = 1 - slider.value / 100
        slider.thumbTintColor = UIColor.red.withAlphaComponent(CGFloat(alphaComponent))
    }
    
    private func setupSlider() {
        slider.value = 0
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.thumbTintColor = UIColor.red.withAlphaComponent(1)
    }
}

struct SliderViewControllerRepresentation: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "SliderViewController")
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}

struct SliderViewController_Previews: PreviewProvider {
    static var previews: some View {
        SliderViewControllerRepresentation()
    }
}
