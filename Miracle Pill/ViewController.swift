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

    // Instance vars
    let states: [String] = ["Alaska", "Arkansas", "Alabama", "California", "Maine", "New York"]
    
    // MARK: - Outlets
    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var statePickerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource = self
        statePicker.delegate = self
    }
    
    // MARK: - Actions
    @IBAction func stateButtonPressed(_ sender: UIButton) {
        statePicker.isHidden = false
        
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
        statePickerButton.setTitle(states[row], for: UIControlState.normal)
        statePicker.isHidden = true
    }
}

