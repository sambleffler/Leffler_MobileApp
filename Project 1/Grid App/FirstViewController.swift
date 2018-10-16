//
//  FirstViewController.swift
//  Grid App
//
//  Created by Sam Leffler on 10/11/18.
//  Copyright © 2018 Sam Leffler. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var widthInput: UITextField!
    @IBOutlet weak var heightInput: UITextField!
    @IBOutlet weak var fontInput: UITextField!
    @IBOutlet weak var leadingInput: UITextField!
    @IBOutlet weak var rowsInput: UITextField!
    @IBOutlet weak var columnInput: UITextField!
    @IBOutlet weak var components: UISegmentedControl!
    @IBOutlet weak var textDisplay: UILabel!
    @IBOutlet weak var LRstepper: UIStepper!
    @IBOutlet weak var TBstepper: UIStepper!
    @IBOutlet weak var leftStepper: UIStepper!
    @IBOutlet weak var topStepper: UIStepper!
    @IBOutlet weak var totalVertical: UILabel!
    @IBOutlet weak var outside: UILabel!
    @IBOutlet weak var inside: UILabel!
    @IBOutlet weak var totalHorizontal: UILabel!
    @IBOutlet weak var bottom: UILabel!
    @IBOutlet weak var top: UILabel!
    
    var width: Double?
    var height: Double?
    var size: Double?
    var leading: Double?
    var columns: Double?
    var rows: Double?
    
    var correctLeading: Double?
    var horizontalOffset : Double?
    var baselines : Double?
    
    var totalVerticalLines:Double?
    var marginTotalLR: Double?
    var marginTotalTB:Double?
    
    var leftMargin: Double?
    var rightMargin: Double?
    var topMargin: Double?
    var bottomMargin: Double?
    
    @IBAction func incrementVTotal(_ sender: Any) {
        if widthInput.text!.isEmpty || heightInput.text!.isEmpty || fontInput.text!.isEmpty || leadingInput.text!.isEmpty || columnInput.text!.isEmpty || rowsInput.text!.isEmpty{
            let alert = UIAlertController(title: "Warning", message: "Fill in all values", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        }
        else{
        marginTotalLR = LRstepper.value * columns!
        totalVertical.text = "Vertical Margin Total Gridlines: " + String(marginTotalLR!)
        leftStepper.maximumValue = marginTotalLR!
        leftStepper.value=0
        leftMargin = 0
        rightMargin = marginTotalLR!
        outside.text = "Outside Margin Gridlines: " + String(round(rightMargin!*1000)/1000)
        inside.text = "Inside Margin Gridlines: " + String(round(1000*leftMargin!)/1000)
        }
    }
    @IBAction func incrementInside(_ sender: Any) {
        
        if widthInput.text!.isEmpty || heightInput.text!.isEmpty || fontInput.text!.isEmpty || leadingInput.text!.isEmpty || columnInput.text!.isEmpty || rowsInput.text!.isEmpty{
            let alert = UIAlertController(title: "Warning", message: "Fill in all values", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        }
        else{
        leftMargin = leftStepper.value
        rightMargin = marginTotalLR! - leftMargin!
        outside.text = "Outside Margin Gridlines: " + String(round(1000*rightMargin!)/1000)
        inside.text = "Inside Margin Gridlines: " + String(round(leftMargin!*1000)/1000)
        }
    }
    @IBAction func incrementHTotal(_ sender: Any) {
        
        if widthInput.text!.isEmpty || heightInput.text!.isEmpty || fontInput.text!.isEmpty || leadingInput.text!.isEmpty || columnInput.text!.isEmpty || rowsInput.text!.isEmpty{
            let alert = UIAlertController(title: "Warning", message: "Fill in all values", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        }
        else{
        marginTotalTB = TBstepper.value * rows!
        totalHorizontal.text = "Horizontal Margin Total Gridlines: " + String(round(marginTotalTB!*1000)/1000)
        topStepper.maximumValue = marginTotalTB!
        topStepper.value=0
        bottomMargin = 0
        topMargin = marginTotalTB!
        top.text = "Top Margin Gridlines: " + String(round(1000*topMargin!)/1000)
        bottom.text = "Bottom Margin Gridlines: " + String(round(1000*bottomMargin!)/1000)
        }
    }
    @IBAction func incrementTop(_ sender: Any) {
        
        if widthInput.text!.isEmpty || heightInput.text!.isEmpty || fontInput.text!.isEmpty || leadingInput.text!.isEmpty || columnInput.text!.isEmpty || rowsInput.text!.isEmpty{
            let alert = UIAlertController(title: "Warning", message: "Fill in all values", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        }
        else{
        topMargin = marginTotalTB! - bottomMargin!
        bottomMargin = topStepper.value
        bottom.text = "Bottom Margin Gridlines: " + String(round(bottomMargin!*1000)/1000)
        top.text = "Top Margin Gridlines: " + String(round(1000*topMargin!)/1000)
        }
    }
    @IBAction func calcButton(_ sender: UIButton) {

        update()
    }
    
    @IBAction func segments(_ sender: Any) {
        update()
    }
    override func viewDidLoad() {
        
        widthInput.delegate=self
        heightInput.delegate=self
        fontInput.delegate=self
        leadingInput.delegate=self
        columnInput.delegate=self
        rowsInput.delegate=self
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if widthInput.text!.isEmpty==false{
            width = Double(widthInput.text!)!
        }
        if heightInput.text!.isEmpty==false{
            height = Double(heightInput.text!)!
        }
        if fontInput.text!.isEmpty==false{
            size = Double(fontInput.text!)!
        }
        if leadingInput.text!.isEmpty==false{
            leading = Double(leadingInput.text!)!
        }
        if columnInput.text!.isEmpty==false{
            columns = Double(columnInput.text!)!
        }
        if rowsInput.text!.isEmpty==false{
            rows = Double(rowsInput.text!)!
        }
        if width != nil && height != nil && size != nil && leading != nil && columns != nil && rows != nil{
            correctLeading = height! * 72 / Double(Int(height! / leading! * 72))
            horizontalOffset = width! * 72 / Double(Int(width! / size! * 72))
            baselines = Double(height! * 72 / correctLeading!)
            
            totalVerticalLines = width!*72/horizontalOffset!
            
            
            
            leftMargin = 0
            rightMargin = totalVerticalLines!
            topMargin = baselines!
            bottomMargin = 0
            
            LRstepper.maximumValue = totalVerticalLines! / columns!
            LRstepper.value=totalVerticalLines! / columns!
            LRstepper.minimumValue=0
            
            marginTotalLR = LRstepper.value * columns!
            leftStepper.maximumValue = marginTotalLR!
            leftStepper.minimumValue = 0
            leftStepper.stepValue = 1
            leftStepper.value=0
            
            marginTotalTB = baselines
            TBstepper.maximumValue = baselines!/rows!
            TBstepper.minimumValue=0
            TBstepper.value = baselines!/rows!
            
            topStepper.maximumValue = marginTotalTB!
            topStepper.minimumValue = 0
            topStepper.stepValue = 1
            topStepper.value = 0
            
            totalVertical.text = "Vertical Margin Total Gridlines: " + String(round(1000*marginTotalLR!)/1000)
            totalHorizontal.text = "Horizontal Margin Total Gridlines: " + String(round(1000*marginTotalTB!)/1000)
            inside.text = "Inside Margin Gridlines: " + String(round(1000*leftMargin!)/1000)
            outside.text = "Outside Margin Gridlines: " + String(round(1000*rightMargin!)/1000)
            top.text = "Top Margin Gridlines: " + String(round(topMargin!*1000)/1000)
            bottom.text = "Bottom Margin Gridlines: " + String(round(bottomMargin!*1000)/1000)
            
        }
        
        
    }
    
    func update()  {
        if widthInput.text!.isEmpty || heightInput.text!.isEmpty || fontInput.text!.isEmpty || leadingInput.text!.isEmpty || columnInput.text!.isEmpty || rowsInput.text!.isEmpty{
            let alert = UIAlertController(title: "Warning", message: "Fill in all values", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        }
            
        else{
            
            switch components.selectedSegmentIndex{
            case 0:
                
                textDisplay.text = "Correct Leading: " + String(round(1000*correctLeading!)/1000) + "\nHorizontal Offset: " + String(round(1000*horizontalOffset!)/1000) + "\nBaselines: " + String(round(1000*baselines!)/1000) + "\nImage Lines: " + String(round(1000*(baselines!-1))/1000)
                
            case 1:
                textDisplay.text = "Margin Top: " + String(round(topMargin!*correctLeading!*1000)/1000) + "in\nMargin Bottom: " + String(round(1000*bottomMargin!*correctLeading!)/1000) + "in\nMargin Inside: " + String(round(leftMargin!*horizontalOffset!*1000)/1000) + "in\nOutside Margin: " + String(round(rightMargin!*horizontalOffset!*1000)) + "in\nColumn Gutter: " + String(round(horizontalOffset!*1000)/1000) + "in\nRow Gutter: " + String(round(1000*height!/baselines!)/1000)
                
            default:
                textDisplay.text = ""
            }
        }
    }
   

}

