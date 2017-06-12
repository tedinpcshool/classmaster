//
//  ViewController.swift
//  TEDDemo
//
//  Created by ios on 2017/6/9.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let vc1 = TEDVC1()
        
        let vc2 = TEDVC1()
        
        
        
        
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(gotoTEDVC1), userInfo: nil, repeats: false)
        
    }

    func gotoTEDVC1(){
        
        let vc1 = self.storyboard?.instantiateViewController(withIdentifier: "TEDVC1") as! TEDVC1
        
        
        print("gotoTEDVC1")
        
//        http://www.jianshu.com/p/c2f3c8669412
        
//        self.view.window?.layer.add(<#T##anim: CAAnimation##CAAnimation#>, forKey: nil)
        
//        self.present(<#T##viewControllerToPresent: UIViewController##UIViewController#>, animated: <#T##Bool#>, completion: (() -> Void)?)
        
        self.present(vc1, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

