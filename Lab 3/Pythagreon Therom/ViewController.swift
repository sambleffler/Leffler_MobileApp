//
//  ViewController.swift
//  Pythagreon Therom
//
//  Created by Sam Leffler on 9/27/18.
//  Copyright © 2018 Sam Leffler. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var aInput: UITextField!
    @IBOutlet weak var bInput: UITextField!
    @IBOutlet weak var cInput: UITextField!
    @IBOutlet weak var aOutput: UILabel!
    @IBOutlet weak var bOutput: UILabel!
    @IBOutlet weak var cOutput: UILabel!
    @IBAction func solveButton(_ sender: Any) {
        solve()
        aInput.resignFirstResponder()
        bInput.resignFirstResponder()
        cInput.resignFirstResponder()
    }
    
    
//     can only dismiss when tapping outside the stackview
//     based on this solution: http://www.globalnerdy.com/2015/05/18/how-to-dismiss-the-ios-keyboard-when-the-user-taps-the-background-in-swift/
//     could not get book method to work
    @IBAction func onTapGestureRecognized(_ sender: AnyObject) {
        view.endEditing(true)
    }
    
//    func dismissKeyboard()
//    {
//        view.endEditing(true)
//    }
    
    override func viewDidLoad() {
        aInput.delegate=self
        bInput.delegate=self
        cInput.delegate=self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func solve(){
        var a: Double = 0
        var b: Double = 0
        var c: Double = 0
        
        if !aInput.text!.isEmpty{
            a=Double(aInput.text!)!
        }
        
        if !bInput.text!.isEmpty{
            b=Double(bInput.text!)!
        }
        
        if !cInput.text!.isEmpty{
            c=Double(cInput.text!)!
        }
        
        if (c>a && c>b && c != 0) || c == 0{
            if (a>0 && b>0 && c == 0) || (c>0 && b>0 && a==0) || (a>0 && c>0 && b == 0){
                
                if a != 0 && b != 0 && c == 0{
                    c=sqrt(pow(a,2)+pow(b, 2))
                    cOutput.text=String(c)
                    bOutput.text=String(b)
                    aOutput.text=String(a)
                } else{
                    if a != 0 && c != 0 && b == 0{
                        b=sqrt(pow(c,2)-pow(a, 2))
                        cOutput.text=String(c)
                        bOutput.text=String(b)
                        aOutput.text=String(a)
                    }else{
                        if b != 0 && c != 0 && a == 0{
                            a=sqrt(pow(c,2)-pow(b, 2))
                            cOutput.text=String(c)
                            bOutput.text=String(b)
                            aOutput.text=String(a)
                        }
                    }
                }
            }
                
            else{
                let alert = UIAlertController(title: "Warning", message: "Input two values greater than zero", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alert.addAction(cancelAction)
//                let okAction=UIAlertAction(title: "Okay", style: .default, handler: {action in
//                    self.aInput.text=""
//                    self.bInput.text=""
//                    self.cInput.text=""
//                    self.solve()})
               // alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            }
        }
        else{
            let alert = UIAlertController(title: "Warning", message: "Hypotenuse must be longer that the legs", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            //let okAction=UIAlertAction(title: "Okay", style: .default, handler: {action in})
            //alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //solve()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}



