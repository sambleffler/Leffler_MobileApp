//
//  EmailViewController.swift
//  Midterm
//
//  Created by Sam Leffler on 10/18/18.
//  Copyright © 2018 Sam Leffler. All rights reserved.
//

import UIKit

class EmailViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var emailInput: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneEmail"{
            let scene1ViewController = segue.destination as! ViewController
            //check to see that text was entered in the textfields
            if nameInput.text!.isEmpty == false{
                scene1ViewController.user.name=nameInput.text
            }
            if emailInput.text!.isEmpty == false{
                scene1ViewController.user.email=emailInput.text
            }
        }
    }
    
    override func viewDidLoad() {
        
        nameInput.delegate=self
        emailInput.delegate=self
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
