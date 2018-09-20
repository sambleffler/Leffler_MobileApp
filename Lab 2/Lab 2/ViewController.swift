//
//  ViewController.swift
//  Lab 2
//
//  Created by Sam Leffler on 9/19/18.
//  Copyright © 2018 Sam Leffler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var catchphrase: UILabel!
    @IBOutlet weak var pic: UIImageView!
    @IBOutlet weak var picControl: UISegmentedControl!
    @IBOutlet weak var sizeSlider: UISlider!
    @IBOutlet weak var emphasisSwitch: UISwitch!
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var slideLabel: UILabel!
    
    func changePic(){
        if picControl.selectedSegmentIndex==0{
            catchphrase.text="I'm Ready!"
            pic.image=UIImage(named: "Spongebob")
        }
        else if picControl.selectedSegmentIndex==1{
            catchphrase.text="Eh, What's up Doc?"
            pic.image=UIImage(named: "bugs")
        }
        else if picControl.selectedSegmentIndex==2{
            catchphrase.text="Scooby-Dooby-Doo!"
            pic.image=UIImage(named: "Scooby-Doo")
        }
    }
    
    func emphasize(){
        if emphasisSwitch.isOn {
            catchphrase.text=catchphrase.text?.uppercased()
            catchphrase.font=UIFont.boldSystemFont(ofSize: CGFloat(sizeSlider.value))
        } else {
            catchphrase.text=catchphrase.text?.lowercased()
            catchphrase.font=UIFont.systemFont(ofSize: CGFloat(sizeSlider.value))
        }
    }
    
    func colorize(){
        if redSwitch.isOn {
            catchphrase.textColor=UIColor.red
        } else {
            catchphrase.textColor=UIColor.black
        }
    }
    
    @IBAction func changeInfo(_ sender: UISegmentedControl) {
        changePic()
        emphasize()
        colorize()
    }
    
    @IBAction func updateFont(_ sender: UISwitch) {
        emphasize()
        colorize()
    }
    
    @IBAction func changeFontSize(_ sender: UISlider) {
        let fontSize=sender.value
        slideLabel.text=String(format: "%.0f", fontSize)
        let fontSizeCGFloat=CGFloat(fontSize)
        catchphrase.font=UIFont.systemFont(ofSize: fontSizeCGFloat)
        emphasize()
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

