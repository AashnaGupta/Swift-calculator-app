//
//  ViewController.swift
//  calculator
//
//  Created by Kids on 7/7/20.
//  Copyright © 2020 anish. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var performingMath = false;
    var operation = "";
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true
        {
            label.text = String(sender.tag - 1);
            numberOnScreen = Double(label.text!)!
            performingMath = false
        }
        
        else
        {
            label.text = label.text! + String(sender.tag - 1)
            numberOnScreen = Double(label.text!)!
        }
        
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if label.text != "" && sender.tag != 11 && sender.tag != 16
        {
            previousNumber = Double(label.text!)!
            if sender.tag == 12 //Divide
            {
                label.text = "/";
                operation = "/"
            }
            else if sender.tag == 13 //Multiply
            {
                 label.text = "X";
                 operation = "X"
            }
            else if sender.tag == 14 //Subtract
            {
                 label.text = "-";
                 operation = "-"
            }
            else if sender.tag == 15 //Add
            {
                label.text = "+";
                operation = "+"
            }
            performingMath = true
        }
        else if sender.tag == 16
        {
            if operation == "+"
            {
                label.text = String(previousNumber+numberOnScreen)
            }
            else if operation == "-"
            {
                label.text = String(previousNumber-numberOnScreen)
            }
            else if operation == "/"
            {
                label.text = String(previousNumber/numberOnScreen)
            }
            else if operation == "X"
            {
                label.text = String(previousNumber*numberOnScreen)
            }
        }
        else if sender.tag == 11
        {
            numberOnScreen = 0;
            previousNumber = 0;
            label.text = "";
            operation = "";
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
