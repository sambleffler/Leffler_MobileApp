//
//  ViewController.swift
//  Midterm
//
//  Created by Sam Leffler on 10/18/18.
//  Copyright © 2018 Sam Leffler. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var timeInput: UITextField!
    @IBOutlet weak var weeklySwitch: UISwitch!
    @IBOutlet weak var perWeekLabel: UILabel!
    @IBOutlet weak var weeklySlide: UISlider!
    @IBOutlet weak var exercises: UISegmentedControl!
    @IBOutlet weak var milesLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var user = emailInfo()
    let filename = "test.plist"
    
    @IBAction func unwindSegue (_ segue:UIStoryboardSegue){
        nameLabel.text=user.name
        emailLabel.text=user.email
    }
    
    func dataFileURL(_ filename:String) -> URL? {
        let urls = FileManager.default.urls(for:.documentDirectory, in: .userDomainMask)
        var url : URL?
        url = urls.first?.appendingPathComponent(filename)
        return url
    }
    
    @IBAction func calcButton(_ sender: UIButton) {
        if timeInput.text!.isEmpty{
            let alert = UIAlertController(title: "Warning", message: "Enter workout duration", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        }
        else{
            if Double(timeInput.text!)! < 30{
                let alert = UIAlertController(title: "Warning", message: "Workout must be at least 30min", preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alert.addAction(cancelAction)
                let okAction=UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {action in
                    self.timeInput.text="30"
                    self.calculate()
                })
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            }
            else{
                calculate()
            }
        }
            
        
    }
    @IBAction func changeWeekly(_ sender: UISlider) {
        let wpw=sender.value
        perWeekLabel.text="Workouts/Week: "+String(format: "%.0f", wpw)
    }
    override func viewDidLoad() {
        timeInput.delegate=self
        
        let fileURL = dataFileURL(filename)
        
        if FileManager.default.fileExists(atPath: (fileURL?.path)!){
            let url = fileURL!
            do {
                let data = try Data(contentsOf: url)
                let decoder = PropertyListDecoder()
                user = try decoder.decode(emailInfo.self, from: data)
                nameLabel.text=user.name
                emailLabel.text=user.email
            } catch {
                print("no file")
            }
            
        }
        else {
            print("file does not exist")
        }
        let app = UIApplication.shared
        NotificationCenter.default.addObserver(self, selector: #selector(self.applicationWillResignActive(_:)), name: Notification.Name.UIApplicationWillResignActive, object: app)
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func changeExercise(_ sender: UISegmentedControl) {
        switch exercises.selectedSegmentIndex{
        case 0:
            
            picture.image=UIImage(named: "run")
            
        case 1:
            picture.image=UIImage(named: "swim")
            
        case 2:
            picture.image=UIImage(named: "bike")
            
        default:
            picture.image=UIImage(named: "run")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func calculate() {
        
        if weeklySwitch.isOn{
            switch exercises.selectedSegmentIndex{
            case 0:
                
                milesLabel.text=String(Float(timeInput.text!)!/10*round(weeklySlide.value))+" miles"
                caloriesLabel.text=String((Float(timeInput.text!)!/60)*600*round(weeklySlide.value))+" calories"
                
            case 1:
                milesLabel.text=String(Float(timeInput.text!)!/30*round(weeklySlide.value))+" miles"
                caloriesLabel.text=String((Float(timeInput.text!)!/60)*420*round(weeklySlide.value))+" calories"
                
            case 2:
                milesLabel.text=String(Float(timeInput.text!)!/4*round(weeklySlide.value))+" miles"
                caloriesLabel.text=String((Float(timeInput.text!)!/60)*510*round(weeklySlide.value))+" calories"
                
            default:
                milesLabel.text = ""
                caloriesLabel.text = ""
            }
        }
        
        else{
            switch exercises.selectedSegmentIndex{
            case 0:
                
                milesLabel.text=String(Double(timeInput.text!)!/10)+" miles"
                caloriesLabel.text=String((Double(timeInput.text!)!/60)*600)+" calories"
                
            case 1:
                milesLabel.text=String(Double(timeInput.text!)!/30)+" miles"
                caloriesLabel.text=String((Double(timeInput.text!)!/60)*420)+" calories"
                
            case 2:
                milesLabel.text=String(Double(timeInput.text!)!/4)+" miles"
                caloriesLabel.text=String((Double(timeInput.text!)!/60)*510)+" calories"
                
            default:
                milesLabel.text = ""
                caloriesLabel.text = ""
            }
        }
        
        
    }
    
    @objc func applicationWillResignActive(_ notification: Notification){
        let fileURL = dataFileURL(filename)
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        do {
            let plistData = try encoder.encode(user)
            try plistData.write(to: fileURL!)
        } catch {
            print("write error")
        }
    }

}

