//
//  ViewController.swift
//  Prework
//
//  Created by Juan Martinez on 1/21/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var partySize: UILabel!
    @IBOutlet weak var groupStepper: UIStepper!
    @IBOutlet weak var partyAmountLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Sets the title in the Navigation Bar
        self.title = "Tip Calculator"
        
        // value of stepper changes
        groupStepper.wraps = true
        groupStepper.autorepeat = true
        groupStepper.maximumValue = 10
    }
    public var total = 0.0
    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        // Get Total tip by multiplying tip * tipPercentage
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill *
            tipPercentages[tipControl.selectedSegmentIndex]
        total = bill + tip
        
        // update Tip Amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // update Total Amount
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    
    @IBAction func groupValueChanged(_ sender: UIStepper) {
        partySize.text = Int(sender.value).description
        let groupSize = Int(sender.value)
        let groupTip =  total / Double(groupSize)
        partyAmountLabel.text = String(format: "$%.2f", groupTip)
    }
    
}
