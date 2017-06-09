//
//  SGVC1.swift
//  D 01
//
//  Created by ios135 on 2017/6/9.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit

class SGVC1: UIViewController {

    
    
    @IBAction func pushBtn(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
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
