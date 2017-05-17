//
//  ViewController.swift
//  Holland
//
//  Created by ios135 on 2017/5/17.
//  Copyright © 2017年 ios135. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource {
    
   
    let RoomNum:[String] = ["R101", "R102", "R103", "R105", "R106", "R107", "R108", "R110", "R201", "R202", "R203", "R205", "R206", "R207", "R208", "R210", "R211", "R221", "R222", "R223", "R301", "R302", "R303", "R305", "R306", "R307", "R308", "R310", "R311", "R501", "R502", "R503", "R505", "R506", "R507", "R508", "R510", "R511", "R512", "R513", ]
    
    @IBOutlet var pkRoom: UIPickerView!
    @IBAction func btnStart(_ sender: Any) {
        
        
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return RoomNum.count
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        for i in 0...40{
//            pkRoom.addSubview(RoomNum[i])
//        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

