//
//  MemberAreaVC.swift
//  classmaster
//
//  Created by ios135 on 2017/5/19.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit
import InteractiveSideMenu
class MemberAreaVC: MenuItemContentViewController {

    @IBAction func MbAreaBtn(_ sender: Any) {
        showMenu()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
