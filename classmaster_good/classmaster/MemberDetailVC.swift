//
//  MemberDetailVC.swift
//  classmaster
//
//  Created by 黃威淵 on 2017/5/23.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit

class MemberDetailVC: UIViewController {

    let userDefault = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutBtn(_ sender: UIButton) {
        userDefault.removeObject(forKey: "usernames")
        self.navigationController?.popViewController(animated: true)
    }

    
    
}
