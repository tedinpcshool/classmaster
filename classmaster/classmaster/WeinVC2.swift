//
//  WeinVC2.swift
//  classmaster
//
//  Created by 黃威淵 on 2017/5/29.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit
import InteractiveSideMenu
import FirebaseDatabase
import FirebaseAuth
class WeinVC2: MenuItemContentViewController {
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var actionBtn: UIButton!
    @IBOutlet weak var className: UILabel!
    @IBOutlet weak var classLocaton: UILabel!
    @IBOutlet weak var classDay: UILabel!
    @IBOutlet weak var classTime: UILabel!
   
    var ref: DatabaseReference!
 
    var userDefault = UserDefaults.standard
    var userData = [String:AnyObject]()
    var dataBaseHandle:DatabaseHandle?
    
    var classObj:ClassModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        ref = Database.database().reference()
//        print(ref.description)
        self.navigationController?.navigationBar.topItem?.title = "會員專區"
        if userDefault.object(forKey: "userInfo") == nil
        {
           msg(myTitle: "未登入", myMessage: "請先登入會員")
        }
        
        if let  wUserInfo:[NSData] = userDefault.object(forKey: "userInfo") as? [NSData]
       {
           let newName = NSKeyedUnarchiver.unarchiveObject(with: wUserInfo[0] as Data) as! String
           let newGender = NSKeyedUnarchiver.unarchiveObject(with: wUserInfo[1] as Data) as! String
           let newEmail = NSKeyedUnarchiver.unarchiveObject(with: wUserInfo[2] as Data) as! String
           let newPassWord = NSKeyedUnarchiver.unarchiveObject(with: wUserInfo[3] as Data) as! String
           let newPhone = NSKeyedUnarchiver.unarchiveObject(with: wUserInfo[4] as Data) as! String
        
           let user = UserInfo(userName: newName, gender: newGender, email: newEmail, passWord: newPassWord, phone: newPhone)
           userName.text = user.userName
           gender.text = user.gender
           email.text = user.email
           phone.text = user.phone
        }
        if classObj != nil
        {
            className.text = classObj?.className
            classLocaton.text = classObj?.location
            classDay.text = (classObj?.day[0])! + "," + (classObj?.day[1])!
            classTime.text = (classObj?.time[0])! + "," + (classObj?.time[1])!
            actionBtn.setTitle("確定報名", for: .normal)
        }
//        let userID = Auth.auth().currentUser?.uid
//        ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
//            // Get user value
//            let value = snapshot.value as? NSDictionary
//            self.className.text = value?["classname"] as? String ?? ""
//            self.classLocaton.text = value?["classLocaton"] as? String ?? ""
//            self.classDay.text = value?["classDay"] as? String ?? ""
//            self.classTime.text = value?["classTime"] as? String ?? ""
//            
//            
//        }) { (error) in
//            print(error.localizedDescription)
//        }

       
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
     
    }
    
    @IBAction func logoutBtn(_ sender: UIButton) {
        
        if actionBtn.currentTitle == "登出"
        {
            if Auth.auth().currentUser != nil {
                do {
                    try Auth.auth().signOut()
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "MemberVC")as! MemberAreaVC
                    self.show(vc, sender: self)
                    
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
           }
            userDefault.removeObject(forKey: "userInfo")
            userDefault.synchronize()
            userName.text = ""
            gender.text = ""
            email.text = ""
            phone.text = ""
            className.text = ""
            classLocaton.text = ""
            classDay.text = ""
            classTime.text = ""

        }else
        {
             let userRef = self.ref.child("users")
             let uid = userDefault.object(forKey: "useruid") as! String
             let newUserRef = userRef.child(uid)
            newUserRef.setValue(["username":self.userName.text,"email":self.email.text,"phone":self.phone.text,"classname":self.className.text,"classLocaton":self.classLocaton.text,"classDay":self.classDay.text,"classTime":self.classTime.text])
        }
        
      }
    
        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func msg(myTitle:String,myMessage:String){
        let alertController = UIAlertController(title: myTitle, message: myMessage, preferredStyle: UIAlertControllerStyle.alert)
        let btn1 = UIAlertAction(title: "確定", style: UIAlertActionStyle.default) {(btn1)in
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "MemberVC")as! MemberAreaVC
            self.show(vc, sender: self)

        }
        
        alertController.addAction(btn1)
        present(alertController, animated: false, completion: nil)
    }

   
}
