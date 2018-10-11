//
//  addItemViewController.swift
//  Lab 4
//
//  Created by Sam Leffler on 10/10/18.
//  Copyright © 2018 Sam Leffler. All rights reserved.
//

import UIKit

import UIKit

class addItemViewController: UIViewController, UITextFieldDelegate {
    
        @IBOutlet weak var userItem: UITextField!
        @IBOutlet weak var userQuantity: UITextField!
    @IBOutlet weak var listType: UISegmentedControl!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "doneAdd"{
                let scene1ViewController = segue.destination as! ViewController
                //check to see that text was entered in the textfields
                if userItem.text!.isEmpty == false{
                    scene1ViewController.userList.item=userItem.text
                }
                if userQuantity.text!.isEmpty == false{
                    scene1ViewController.userList.quantity=userQuantity.text
                }
                scene1ViewController.userList.category=listType.selectedSegmentIndex
        }
        }
    
    
    override func viewDidLoad() {
                    userItem.delegate=self
                    userQuantity.delegate=self
        super.viewDidLoad()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
