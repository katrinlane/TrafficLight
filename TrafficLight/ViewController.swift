//
//  ViewController.swift
//  TrafficLight
//
//  Created by Kate on 22.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var redLight: UIView!
    @IBOutlet var yellowLight: UIView!
    @IBOutlet var greenLight: UIView!
    @IBOutlet var signalSwitchButton: UIButton!
    
    let activeLight = 1.0
    let lightOff = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signalSwitchButton.configuration = setupButton(with: "Start")
        
        redLight.layer.cornerRadius = 50
        yellowLight.layer.cornerRadius = 50
        greenLight.layer.cornerRadius = 50
        
        redLight.alpha = lightOff
        yellowLight.alpha = lightOff
        greenLight.alpha = lightOff

    }
    
    
    @IBAction func signalSwitchButtonTapped() {
        signalSwitchButton.configuration = setupButton(with: "Next")
        
        if redLight.alpha == yellowLight.alpha {
            redLight.alpha = activeLight
            greenLight.alpha = lightOff
            
        } else if redLight.alpha == activeLight && greenLight.alpha == yellowLight.alpha {
            redLight.alpha = lightOff
            yellowLight.alpha = activeLight
        } else if yellowLight.alpha == activeLight && greenLight.alpha == redLight.alpha {
            yellowLight.alpha = lightOff
            greenLight.alpha = activeLight
        }
    }
    private func setupButton(with title: String) -> UIButton.Configuration {
        var buttonConfiguration = UIButton.Configuration.filled()
        buttonConfiguration.cornerStyle = .large
        buttonConfiguration.title = title
        buttonConfiguration.baseBackgroundColor = #colorLiteral(red: 0.01768360101, green: 0.1995446384, blue: 1, alpha: 1)
        buttonConfiguration.buttonSize = .large
        buttonConfiguration.attributedTitle?.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        return buttonConfiguration
    }
    
}
