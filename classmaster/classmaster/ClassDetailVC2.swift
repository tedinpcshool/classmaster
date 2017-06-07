//
//  ClassDetailVC2.swift
//  classmaster
//
//  Created by ios135 on 2017/5/17.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit

class ClassDetailVC2: UIViewController {
    
    @IBOutlet weak var classNameLabel: UILabel!
    @IBOutlet weak var zoomLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var teacherNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    

    var classObj:ClassModel?
    let userDefault = UserDefaults.standard
    var users = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
      override func viewDidAppear(_ animated: Bool) {
       
          classNameLabel.text = classObj?.className!
          zoomLabel.text = classObj?.zoom!
          categoryLabel.text = classObj?.category!
          teacherNameLabel.text = classObj?.teacherName!
          dayLabel.text = (classObj?.day[0])! + "," + (classObj?.day[1])!
          timeLabel.text = (classObj?.time[0])! + "," +  (classObj?.time[1])!
          locationLabel.text = classObj?.location!
                
    }
    
    @IBAction func signUpBtn(_ sender: UIButton) {
              
        if userDefault.object(forKey: "userInfo") != nil{

            let weinClass = UIStoryboard(name: "MemArea", bundle: nil)
            let nWeinVC = weinClass.instantiateViewController(withIdentifier: "goToWeinVC2") as! WeinVC2
            self.show(nWeinVC, sender: self)
            
            nWeinVC.classObj = self.classObj
//            userDefault.set(self.classObj?.className, forKey: "classname")
//            userDefault.synchronize()

        }else
        {
            msg(myTitle: "未加入會員", myMessage: "請先登入會員")
            

        }
        
    }
    
    func msg(myTitle:String,myMessage:String){
        let alertController = UIAlertController(title: myTitle, message: myMessage, preferredStyle: UIAlertControllerStyle.alert)
        let btn1 = UIAlertAction(title: "確定", style: UIAlertActionStyle.default) {(btn1)in
            let memberClass = UIStoryboard(name: "MemArea", bundle: nil)
            let nMemberVC = memberClass.instantiateViewController(withIdentifier: "MemberVC") as! MemberAreaVC
            self.show(nMemberVC, sender: self)
            nMemberVC.navigationController?.isNavigationBarHidden = true

        }
        
        alertController.addAction(btn1)
        present(alertController, animated: false, completion: nil)
    }

    
    
}
