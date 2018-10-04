//
//  ViewController.swift
//  Grid Calculator
//
//  Created by Sam Leffler on 10/3/18.
//  Copyright © 2018 Sam Leffler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var widthIn: UITextField!
    @IBOutlet weak var heightIn: UITextField!
    @IBOutlet weak var sizeIn: UITextField!
    @IBOutlet weak var leadingIn: UITextField!
    @IBOutlet weak var columnIn: UITextField!
    @IBOutlet weak var rowsIn: UITextField!
    @IBOutlet weak var gridComponent: UISegmentedControl!
    @IBOutlet weak var gridType: UISegmentedControl!
    @IBOutlet weak var text1: UILabel!
    @IBOutlet weak var text2: UILabel!
    @IBOutlet weak var text3: UILabel!
    @IBOutlet weak var text4: UILabel!
    @IBOutlet weak var text5: UILabel!
    @IBAction func calculate(_ sender: UIButton) {
        if gridType.selectedSegmentIndex==0 && gridComponent.selectedSegmentIndex==0{
            if widthIn.text!.isEmpty || heightIn.text!.isEmpty || sizeIn.text!.isEmpty || leadingIn.text!.isEmpty || columnIn.text!.isEmpty || rowsIn.text!.isEmpty{
                let alert = UIAlertController(title: "Warning", message: "Fill in all values", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alert.addAction(cancelAction)
                present(alert, animated: true, completion: nil)
            }
            else{
                let width: Double = Double(widthIn.text!)!
                let height: Double = Double(heightIn.text!)!
                let size: Double = Double(sizeIn.text!)!
                let leading: Double = Double(leadingIn.text!)!
                let colums: Double = Double(columnIn.text!)!
                let rows: Double = Double(rowsIn.text!)!
                
                let correctLeading: Double = height * 72 / Double(Int(height / leading * 72))
                let horizontalOffset : Double = width * 72 / Double(Int(width / size * 72))
                let baselines : Int = Int(height * 72 / correctLeading)
                text1.text = "Correct Leading: " + String(correctLeading) + "pts"
                text2.text = "Horizontal Offset: " + String(horizontalOffset) + "pts"
                text3.text = "Baselines: " + String(baselines)
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

