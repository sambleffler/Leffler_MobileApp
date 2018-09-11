//
//  ViewController.swift
//  Lab 1
//
//  Created by Sam Leffler on 9/10/18.
//  Copyright © 2018 Sam Leffler. All rights reserved.
//

import UIKit

var count: Int  = 0
let names = ["Tyrannosaurus Rex", "Triceratops", "Stegosaurus"]
//var pics = ["trex", "triceratops", "stegosaurus"]
let pics: [UIImage] = [
    UIImage(named: "trex")!,
    UIImage(named: "triceratops")!,
    UIImage(named: "stegosaurus")!
] //images from Jurassic World's Website

class ViewController: UIViewController {

    @IBOutlet weak var frame: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBAction func navButton(_ sender: UIButton) {
        if sender.tag == 1{
            count += 1
            if count > 2 {
                count = 0
            }
            
            frame.image=pics[count]
            nameLabel.text = names[count]
            
        }
        else{
            if sender.tag == 2{
                count -= 1
                if count < 0  {
                    count = 2
                }
                
                frame.image=pics[count]
                nameLabel.text = names[count]
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

