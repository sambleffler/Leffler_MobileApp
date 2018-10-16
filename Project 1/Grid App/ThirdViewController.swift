//
//  ThirdViewController.swift
//  Grid App
//
//  Created by Sam Leffler on 10/11/18.
//  Copyright © 2018 Sam Leffler. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var widthInput: UITextField!
    @IBOutlet weak var heightInput: UITextField!
    @IBOutlet weak var sizeInput: UITextField!
    @IBOutlet weak var leadingInput: UITextField!
    @IBOutlet weak var ratio1Label: UILabel!
    @IBOutlet weak var ratio2Label: UILabel!
    @IBOutlet weak var displaytext: UILabel!
    @IBOutlet weak var components: UISegmentedControl!
    
    var w: Double?
    var h: Double?
    var fontSize: Double?
    var lead: Double?
    var correctLeading: Double?
    var horizontalOffset : Double?
    
    var outsideMargin: Double = 0
    var insideMargin: Double = 0
    var topMargin: Double = 0
    var bottomMargin: Double = 0
    
    @IBAction func calculate(_ sender: Any) {
        
        update()
        
    }
    
    
    @IBAction func segments(_ sender: Any) {
        update()
    }
    
    override func viewDidLoad() {
        widthInput.delegate=self
        heightInput.delegate=self
        sizeInput.delegate=self
        leadingInput.delegate=self
        
        
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
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if widthInput.text!.isEmpty==false{
            w = Double(widthInput.text!)!
        }
        if heightInput.text!.isEmpty==false{
            h = Double(heightInput.text!)!
        }
        if sizeInput.text!.isEmpty==false{
            fontSize = Double(sizeInput.text!)!
        }
        if leadingInput.text!.isEmpty==false{
            lead = Double(leadingInput.text!)!
        }
        
        if w != nil && h != nil && fontSize != nil && lead != nil {
            
            correctLeading = h! * 72 / Double(Int(h! / lead! * 72))
            horizontalOffset = w! * 72 / Double(Int(w! / fontSize! * 72))
            
            ratio1Label.text! = "Suggested Height (2:3): " + String(round(1000*w!/2 * 3)/1000)
            ratio2Label.text! = "Suggested Height (21:34): " + String(round(w!/34 * 21*1000)/1000)
        }
    }
    
    func update() {
        if widthInput.text!.isEmpty || heightInput.text!.isEmpty || sizeInput.text!.isEmpty || leadingInput.text!.isEmpty{
            let alert = UIAlertController(title: "Warning", message: "Fill in all values", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        }
        else{
            switch components.selectedSegmentIndex{
            case 0:
                
                displaytext.text = "Correct Leading: " + String(round(1000*correctLeading!)/1000) + "pts\nHorizontal Offset: " + String(round(1000*horizontalOffset!/72)/1000) + "in\nVertical Offset: " + String(round(1000*correctLeading! / 72)/1000) + "in"
                
            case 1:
                displaytext.text = "Margin Top: " + String(round(1000*h!/9)/1000) + "in\nMargin Bottom: " + String(round(1000*2*h!/9)/1000) + "in\nMargin Inside: " + String(round(1000*w!/9)/1000) + "in\nOutside Margin: " + String(round(1000*2*w!/9)/1000) + "in\nColumn Gutter: " + String(round(1000*2*w!/45)/1000) + "in"
                
            default:
                displaytext.text = ""
            }
        }
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
