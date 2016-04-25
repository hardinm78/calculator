//
//  ViewController.swift
//  Stanford_Calculator
//
//  Created by Michael Hardin on 4/21/16.
//  Copyright © 2016 Michael Hardin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var actionsLbl: UILabel!
    @IBOutlet private weak var display: UILabel!

    private var userIsInTheMiddleOfTyping = false
    private var historyTextFieldText = ""
    
    
    @IBAction private func touchDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        historyTextFieldText += sender.currentTitle!
        updateHistory()
        if userIsInTheMiddleOfTyping{
        let textCurrentlyInDisplay = display.text!
        display.text = textCurrentlyInDisplay + digit
        }else {
            display.text = digit
        }
        
        userIsInTheMiddleOfTyping = true
        
    }
    
    
   private var displayValue: Double {
        get{
            if Double(display.text!) != nil {
                return Double(display.text!)!
            }else {
                return 0
            }
        }
        set {
            display.text = String(newValue)
        }
    }
    
    
    private var brain = CalculatorBrain()
    
    @IBAction private func performOperation(sender: UIButton) {
        historyTextFieldText += sender.currentTitle!
        updateHistory()
        if userIsInTheMiddleOfTyping {
            brain.setOperand(displayValue)
        }
        
        userIsInTheMiddleOfTyping = false
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(mathematicalSymbol)
         }
        displayValue = brain.result
        
        
    }
    
    private func updateHistory() {
        if historyTextFieldText.characters.count >= 20 {
            historyTextFieldText = ""
        }
        actionsLbl.text = historyTextFieldText
    }
    
    @IBAction func ACPressed(sender: UIButton) {
        userIsInTheMiddleOfTyping = false
        display.text = "0"
        historyTextFieldText = ""
        actionsLbl.text = ""
        brain.allClear()
    }
}


