//
//  BodyInfoViewController.swift
//  TeamFit
//
//  Created by Jake Narkizian on 1/9/15.
//  Copyright (c) 2015 TeamFit. All rights reserved.
//

import Foundation
import UIKit

class BodyInfoViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

    
    @IBOutlet weak var inches: UIPickerView!
    @IBOutlet weak var feet: UIPickerView!
    
    let numbers = ["0","1","2","3","4","5","6","7","8","9","10","11"]

    override func viewDidLoad() {
        super.viewDidLoad()
        feet.dataSource = self
        feet.delegate = self
        
        inches.dataSource = self
        inches.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numbers.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return numbers[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       // myLabel.text = feetNumbers[row]
    }
    
}