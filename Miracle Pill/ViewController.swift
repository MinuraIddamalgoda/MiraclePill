//
//  ViewController.swift
//  Miracle Pill
//
//  Created by Minura Iddamalgoda on 5/1/17.
//  Copyright © 2017 SchemeSeventeen. All rights reserved.
//

import UIKit

class ViewController:
    UIViewController,
    UIPickerViewDataSource,
    UIPickerViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setting up UIPickerView
        statePicker.dataSource = self
        statePicker.delegate = self
    }

    // MARK: - Variables
    let states: [String] = ["Western Australia", "New South Wales", "Northern Territory", "Victoria", "ACT", "Queensland"]
    let darkVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.dark))
    
    
    // MARK: - Outlets
    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var statePickerButton: UIButton!
    @IBOutlet var statePickerView: UIView!
    @IBOutlet var topLevelView: UIView!
    
    // MARK: - Actions
    @IBAction func stateButtonPressed(_ sender: UIButton) {
        showPopup()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        hidePopup()
    }
    
    // MARK: - Delegate Methods
    // MARK: PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        statePickerButton.setTitle(states[row] + " selected", for: UIControlState.normal)
    }
    
    // MARK: - Show/Hide Popup Methods
    func showPopup() {
        // First adding a blue effect behind the picker view
        darkVisualEffectView.frame = topLevelView.bounds
        topLevelView.addSubview(darkVisualEffectView)
        
        // Then showing the picker view itself
        statePickerView.layer.cornerRadius = 5
        statePickerView.center = self.view.center
        self.view.addSubview(statePickerView)
    }
    
    func hidePopup() {
        //self.view.removeFromSuperview()
        statePickerView.removeFromSuperview()
        darkVisualEffectView.removeFromSuperview()
    }
}

