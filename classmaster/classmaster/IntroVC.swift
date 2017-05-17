//
//  IntroVC.swift
//  classmaster
//
//  Created by ios on 2017/5/15.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit

class IntroVC: UIViewController {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var txtview: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setTxtView(tmpStr:String){
        self.txtview.text=tmpStr
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
