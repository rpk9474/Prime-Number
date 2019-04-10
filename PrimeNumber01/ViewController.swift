//
//  ViewController.swift
//  PrimeNumber01
//
//  Created by D7702_10 on 2019. 4. 10..
//  Copyright © 2019년 D7702_10. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var ResultLabel: UILabel!
    @IBOutlet weak var TextArea: UITextField!
    
    var isPrime = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ResultLabel.text = "Check Number"
        
        super.viewDidLoad()
        TextArea.delegate = self
        TextArea.placeholder = "숫자 입력란"
        TextArea.clearButtonMode = UITextField.ViewMode.always
    }


    @IBAction func CheckButton(_ sender: Any) {
        if let number = Int(TextArea.text!) {
            isPrime = true
            
            if ( number <= 0 ) {
                ResultLabel.text = "Please input correct Value"
                TextArea.text = ""
                return
            }
            
            if ( number == 1 ) {
                isPrime = false
            }
            
            if ( number != 1 && number != 2 ) {
                for i in 2 ..< number {
                    if number % i == 0 {
                        isPrime = false
                    }
                }
            }
            
            if ( isPrime == true ) {
                ResultLabel.text = TextArea.text! + " is Prime Number"
            } else {
                ResultLabel.text = TextArea.text! + " is not Prime Number"
            }
            TextArea.text = ""
        } else {
            print("nill")
            ResultLabel.text = "Enter correct Value"
            TextArea.text = ""
        }
    }
    
    // background view를 누르면 키패드가 내려감
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // return 키를 누르면 키패드가 내려감
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        TextArea.resignFirstResponder()
        return true
    }
}

