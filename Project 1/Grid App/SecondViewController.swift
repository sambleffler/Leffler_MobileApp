//
//  SecondViewController.swift
//  Grid App
//
//  Created by Sam Leffler on 10/11/18.
//  Copyright © 2018 Sam Leffler. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var width: UITextField!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var size: UITextField!
    @IBOutlet weak var leading: UITextField!
    @IBOutlet weak var columns: UITextField!
    @IBOutlet weak var cGutter: UITextField!
    @IBOutlet weak var rows: UITextField!
    @IBOutlet weak var rGutter: UITextField!
    @IBOutlet weak var components: UISegmentedControl!
    @IBOutlet weak var displayText: UILabel!
    @IBOutlet weak var insideLabel: UILabel!
    @IBOutlet weak var outsideLabel: UILabel!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var insideStepper: UIStepper!
    @IBOutlet weak var outsideStepper: UIStepper!
    @IBOutlet weak var topStepper: UIStepper!
    @IBOutlet weak var bottomStepper: UIStepper!
    
    var w: Double?
    var h: Double?
    var fontSize: Double?
    var lead: Double?
    var c: Double?
    var cg: Double?
    var r: Double?
    var rg: Double?
    
    var correctLeading: Double?
    var horizontalOffset : Double?
    
    var outsideMargin: Double = 0
    var insideMargin: Double = 0
    var topMargin: Double = 0
    var bottomMargin: Double = 0
    
    var columnGutter: Double?
    var rowGutter: Double?
    
    @IBAction func insideIncrement(_ sender: UIStepper) {
        if width.text!.isEmpty || height.text!.isEmpty || size.text!.isEmpty || leading.text!.isEmpty || columns.text!.isEmpty || rows.text!.isEmpty||rGutter.text!.isEmpty||cGutter.text!.isEmpty{
            let alert = UIAlertController(title: "Warning", message: "Fill in all values", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        }
        else{
        insideMargin = insideStepper.value
        insideLabel.text = "Inside Margin Gridlines: " + String(round(1000*insideMargin)/1000)
        }
    }
    @IBAction func outsideIncrement(_ sender: UIStepper) {
        if width.text!.isEmpty || height.text!.isEmpty || size.text!.isEmpty || leading.text!.isEmpty || columns.text!.isEmpty || rows.text!.isEmpty||rGutter.text!.isEmpty||cGutter.text!.isEmpty{
            let alert = UIAlertController(title: "Warning", message: "Fill in all values", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        }
        else{
        outsideMargin = outsideStepper.value
        outsideLabel.text = "Outside Margin Gridlines: " + String(round(1000*outsideMargin)/1000)
        }
    }
    @IBAction func topIncrement(_ sender: UIStepper) {
        if width.text!.isEmpty || height.text!.isEmpty || size.text!.isEmpty || leading.text!.isEmpty || columns.text!.isEmpty || rows.text!.isEmpty||rGutter.text!.isEmpty||cGutter.text!.isEmpty{
            let alert = UIAlertController(title: "Warning", message: "Fill in all values", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        }
        else{
        topMargin = topStepper.value
        topLabel.text = "Top Margin Gridlines: " + String(round(topMargin*1000)/1000)
        }
    }
    @IBAction func bottomIncrement(_ sender: UIStepper) {
        if width.text!.isEmpty || height.text!.isEmpty || size.text!.isEmpty || leading.text!.isEmpty || columns.text!.isEmpty || rows.text!.isEmpty||rGutter.text!.isEmpty||cGutter.text!.isEmpty{
            let alert = UIAlertController(title: "Warning", message: "Fill in all values", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        }
        else{
        bottomMargin = bottomStepper.value
        bottomLabel.text = "Bottom Margin Gridlines: " + String(round(1000*bottomMargin)/1000)
        }
    }
    @IBAction func calcButton(_ sender: UIButton) {
        update()
    }
    
    
    @IBAction func segments(_ sender: Any) {
        update()
    }
    
    override func viewDidLoad() {
        
        width.delegate=self
        height.delegate=self
        size.delegate=self
        leading.delegate=self
        columns.delegate=self
        cGutter.delegate=self
        rows.delegate=self
        rGutter.delegate=self
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        if width.text!.isEmpty==false{
            w = Double(width.text!)!
        }
        if height.text!.isEmpty==false{
            h = Double(height.text!)!
        }
        if size.text!.isEmpty==false{
            fontSize = Double(size.text!)!
        }
        if leading.text!.isEmpty==false{
            lead = Double(leading.text!)!
        }
        if rows.text!.isEmpty==false{
            r = Double(rows.text!)!
        }
        if columns.text!.isEmpty==false{
            c = Double(columns.text!)!
        }
        if cGutter.text!.isEmpty==false{
            cg = Double(cGutter.text!)!
        }
        if rGutter.text!.isEmpty==false{
            rg = Double(rGutter.text!)!
        }
        
        if w != nil && h != nil && fontSize != nil && lead != nil && r != nil && rg != nil && c != nil && cg != nil {
            
            correctLeading = h! * 72 / Double(Int(h! / lead! * 72))
            horizontalOffset = w! * 72 / Double(Int(w! / fontSize! * 72))

        }
    }
    
    func update(){
        if width.text!.isEmpty || height.text!.isEmpty || size.text!.isEmpty || leading.text!.isEmpty || columns.text!.isEmpty || rows.text!.isEmpty || rGutter.text!.isEmpty || cGutter.text!.isEmpty{
            let alert = UIAlertController(title: "Warning", message: "Fill in all values", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        }
        else{
            switch components.selectedSegmentIndex{
            case 0:
                
                displayText.text = "Correct Leading: " + String(round(1000*correctLeading!)/1000) + "pts\nHorizontal Offset: " + String(round(1000*horizontalOffset!/72)/1000) + "in\nVertical Offset: " + String(round(1000*correctLeading! / 72)/1000) + "in"
                
            case 1:
                displayText.text = "Margin Top: " + String(round(1000*topMargin*correctLeading!/72)/1000) + "in\nMargin Bottom: " + String(round(1000*bottomMargin*correctLeading!/72)/1000) + "in\nMargin Inside: " + String(round(1000*insideMargin*horizontalOffset!/72)/1000) + "in\nOutside Margin: " + String(round(1000*outsideMargin*horizontalOffset!/72)/1000) + "in\nColumn Gutter: " + String(round(1000*horizontalOffset! * cg!/72)/1000) + "in\nRow Gutter: " + String(round(1000*(correctLeading! / 72) * rg!)/1000)
                
            default:
                displayText.text = ""
            }
        }
    }


}

