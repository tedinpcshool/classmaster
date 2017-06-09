//
//  RegisterVC.swift
//  classmaster
//
//  Created by 黃威淵 on 2017/5/23.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
class RegisterVC: UIViewController,UITextFieldDelegate,ZHDropDownMenuDelegate {
    
    @IBOutlet weak var newUserNameTextField: UITextField!
    @IBOutlet weak var newPassWordTextField: UITextField!
    @IBOutlet weak var genderMenu: ZHDropDownMenu!
    
    @IBOutlet weak var newEmailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    
    let userDefault = UserDefaults.standard
    var users = [String]()
    var passWords = [String]()
    
    var genderStr:String?
    
    var emails = [String]()
    var phones = [String]()
    var nUserInfo:[NSData] = []
    var userInfo:UserInfo?
    var classInfo:[ClassModel] = []
 
    override func viewDidLoad() {
        super.viewDidLoad()
      
        newUserNameTextField.delegate = self
        newPassWordTextField.delegate = self
        newEmailTextField.delegate = self
        phoneTextField.delegate = self
        genderMenu.options = ["男","女"]
        genderMenu.showBorder = true
        genderMenu.menuHeight = 100
        genderMenu.delegate = self
//        userDefault.removeObject(forKey: "userInfo")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerBtn(_ sender: UIButton) {
//        if newEmailTextField.text == "" && phoneTextField.text == ""
//        {
//              msg(myTitle: "抱歉", myMessage: "請留完整資料")
//              return
//        }
        
        
        Auth.auth().createUser(withEmail: newEmailTextField.text!, password: newPassWordTextField.text!) { (user, error) in
            if error != nil{
                print(error!.localizedDescription)
                return
            }
              self.userDefault.set(user?.uid, forKey: "useruid")
        }

//        if userDefault.object(forKey: "userInfo") != nil
//        {
//
//              nUserInfo = userDefault.array(forKey: "userInfo") as! [UserInfo]
//
////            users = userDefault.array(forKey: "usernames") as! [String]
////            passWords = userDefault.array(forKey: "passwords") as! [String]
////            genders = userDefault.array(forKey: "genders") as! [String]
////            emails = userDefault.array(forKey: "emails") as! [String]
////            phones = userDefault.array(forKey: "phones") as! [String]
//            
//        }
        
//        if nUserInfo.count == 0
//        {
//             let delegate = UIApplication.shared.delegate as! AppDelegate
//             if delegate.aUserInfo.count == 0
//             {
//                
//                  delegate.aUserInfo = [userInfo!]
//             }
//            nUserInfo = delegate.aUserInfo
//        }
// 
        
        
        
          let newUser = UserInfo(userName: newUserNameTextField.text!, gender: genderStr!, email: newEmailTextField.text!, passWord: newPassWordTextField.text!, phone: phoneTextField.text!)
       
        
          let newName = NSKeyedArchiver.archivedData(withRootObject: newUser.userName!) as NSData
          let newGender = NSKeyedArchiver.archivedData(withRootObject: newUser.gender!) as NSData
          let newEmail = NSKeyedArchiver.archivedData(withRootObject: newUser.email!) as NSData
          let newPassWord = NSKeyedArchiver.archivedData(withRootObject: newUser.passWord!) as NSData
          let newPhone  = NSKeyedArchiver.archivedData(withRootObject: newUser.phone!) as NSData
          nUserInfo = [newName ,newGender ,newEmail ,newPassWord ,newPhone]
        
          userDefault.set(nUserInfo, forKey: "userInfo")
          userDefault.synchronize()
        
        
//        users.insert(newUserNameTextField.text!, at: users.count)
//        passWords.insert(newPassWordTextField.text!, at: passWords.count)
//        genders.insert(genderTextField.text!, at: genders.count)
//        emails.insert(newEmailTextField.text!, at: emails.count)
//        phones.insert(phoneTextField.text!, at: phones.count)
//        userDefault.set(users, forKey: "usernames")
//        userDefault.set(passWords, forKey: "passwords")
//        userDefault.set(genders, forKey: "genders")
//        userDefault.set(emails, forKey: "emails")
//        userDefault.set(phones, forKey: "phones")
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    func msg(myTitle:String,myMessage:String){
        let alertController = UIAlertController(title: myTitle, message: myMessage, preferredStyle: UIAlertControllerStyle.alert)
        let btn1 = UIAlertAction(title: "確定", style: UIAlertActionStyle.default) {(btn1)in
        }
        
        alertController.addAction(btn1)
        present(alertController, animated: false, completion: nil)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         newUserNameTextField.resignFirstResponder()
         newPassWordTextField.resignFirstResponder()
         newEmailTextField.resignFirstResponder()
         phoneTextField.resignFirstResponder()
         return true
        
        
    }
    
    func dropDownMenu(_ menu: ZHDropDownMenu!, didChoose index: Int) {
        
          genderStr = menu.options[index]
//        print("\(menu) choosed at index \(index)")
    }
    
    func dropDownMenu(_ menu: ZHDropDownMenu!, didInput text: String!) {
        
        
        print("\(menu) input text \(text)")
    }

 
}





