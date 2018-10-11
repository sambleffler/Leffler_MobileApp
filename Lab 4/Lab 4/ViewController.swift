//
//  ViewController.swift
//  Lab 4
//
//  Created by Sam Leffler on 10/10/18.
//  Copyright © 2018 Sam Leffler. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var list: UILabel!
    @IBOutlet weak var groceryList: UILabel!
    @IBOutlet weak var clothesList: UILabel!
    @IBOutlet weak var homeList: UILabel!
    
    var userList=shopList()
    var wholeList=[shopList]()
    
    let filename = "Info.plist"
    
    @IBAction func unwindSegue (_segue:UIStoryboardSegue){
        let newItem = shopList()
        newItem.item=userList.item
        newItem.quantity=userList.quantity
        newItem.category=userList.category
        wholeList.append(newItem)
        switch userList.category {
        case 0:
            if groceryList.text!.isEmpty {
                groceryList.text! = userList.quantity! + " " + userList.item! + "\n"
            } else {
                groceryList.text! += userList.quantity! + " " + userList.item! + "\n"
            }
        case 1:
            if clothesList.text!.isEmpty {
                clothesList.text! = userList.quantity! + " " + userList.item! + "\n"
            } else {
                clothesList.text! += userList.quantity! + " " + userList.item! + "\n"
            }
        case 2:
            if homeList.text!.isEmpty {
                homeList.text! = userList.quantity! + " " + userList.item! + "\n"
            } else {
                homeList.text! += userList.quantity! + " " + userList.item! + "\n"
            }
        case 3:
            if list.text!.isEmpty {
                list.text! = userList.quantity! + " " + userList.item! + "\n"
            } else {
                list.text! += userList.quantity! + " " + userList.item! + "\n"
            }
        default:
            if list.text!.isEmpty {
                list.text! = userList.quantity! + " " + userList.item! + "\n"
            } else {
                list.text! += userList.quantity! + " " + userList.item! + "\n"
            }
        }
        
    }
    
    func dataFileURL(_ filename:String) -> URL? {
        let urls = FileManager.default.urls(for:.documentDirectory, in: .userDomainMask)
        var url : URL?
        url = urls.first?.appendingPathComponent(filename)
        return url
    }
    
    override func viewDidLoad() {
        
        let fileURL = dataFileURL(filename)

        if FileManager.default.fileExists(atPath: (fileURL?.path)!){
            let url = fileURL!
            do {
                let data = try Data(contentsOf: url)
                let decoder = PropertyListDecoder()
                wholeList = try decoder.decode([shopList].self, from: data)
                for i in 0..<wholeList.count{
                    switch wholeList[i].category {
                    case 0:
                        if groceryList.text!.isEmpty {
                            groceryList.text! = wholeList[i].quantity! + " " + wholeList[i].item! + "\n"
                        } else {
                            groceryList.text! += wholeList[i].quantity! + " " + wholeList[i].item! + "\n"
                        }
                    case 1:
                        if clothesList.text!.isEmpty {
                            clothesList.text! = wholeList[i].quantity! + " " + wholeList[i].item! + "\n"
                        } else {
                            clothesList.text! += wholeList[i].quantity! + " " + wholeList[i].item! + "\n"
                        }
                    case 2:
                        if homeList.text!.isEmpty {
                            homeList.text! = wholeList[i].quantity! + " " + wholeList[i].item! + "\n"
                        } else {
                            homeList.text! += wholeList[i].quantity! + " " + wholeList[i].item! + "\n"
                        }
                    case 3:
                        if list.text!.isEmpty {
                            list.text! = wholeList[i].quantity! + " " + wholeList[i].item! + "\n"
                        } else {
                            list.text! += wholeList[i].quantity! + " " + wholeList[i].item! + "\n"
                        }
                    default:
                        if list.text!.isEmpty {
                            list.text! = wholeList[i].quantity! + " " + wholeList[i].item! + "\n"
                        } else {
                            list.text! += wholeList[i].quantity! + " " + wholeList[i].item! + "\n"
                        }
                    }
                }

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
    
    @objc func applicationWillResignActive(_ notification: Notification){
        let fileURL = dataFileURL(filename)
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        do {
            let plistData = try encoder.encode(wholeList)
            try plistData.write(to: fileURL!)
        } catch {
            print("write error")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

