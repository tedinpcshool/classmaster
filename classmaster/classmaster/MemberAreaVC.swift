//
//  MemberAreaVC.swift
//  classmaster
//
//  Created by ios135 on 2017/5/19.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit
import InteractiveSideMenu
import GoogleSignIn
import FirebaseAuth
class MemberAreaVC: MenuItemContentViewController,UITextFieldDelegate{
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
   
    
    var userDefault = UserDefaults.standard
    var users = [String]()
    var passWords = [String]()
    var mUserInfo:[NSData] = []
     
    override func viewDidLoad() {
        super.viewDidLoad()

        userNameTextField.delegate = self
        passWordTextField.delegate = self
        
     
               
    }

//    override func viewWillAppear(_ animated: Bool) {
//        self.navigationController?.navigationBar.topItem?.title = "會員專區"
//        
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loginBtn(_ sender: UIButton) {
        
        if userNameTextField.text == "" || passWordTextField.text == ""
        {
            msg(myTitle: "錯誤", myMessage: "欄位不得為空白")
          
        }else
        {
            Auth.auth().signIn(withEmail: self.userNameTextField.text!, password: self.passWordTextField.text!) { (user, error) in
                
                if error == nil {
                    
                    self.navigationController?.popViewController(animated: true)
                    
                } else {
                    
                    self.msg(myTitle: "錯誤!", myMessage: "輸入的Email或密碼有誤!")
                    print(error?.localizedDescription)
                }
            }

        }
            
//        if userDefault.object(forKey: "userInfo") != nil
//        {
//             mUserInfo = userDefault.object(forKey: "userInfo") as! [NSData]
//             let newName = NSKeyedUnarchiver.unarchiveObject(with: mUserInfo[0] as Data) as! String
//             let newGender = NSKeyedUnarchiver.unarchiveObject(with: mUserInfo[1] as Data) as! String
//             let newEmail = NSKeyedUnarchiver.unarchiveObject(with: mUserInfo[2] as Data) as! String
//             let newPassWord = NSKeyedUnarchiver.unarchiveObject(with: mUserInfo[3] as Data) as! String
//             let newPhone = NSKeyedUnarchiver.unarchiveObject(with: mUserInfo[4] as Data) as! String
//            
//             let user = UserInfo(userName: newName, gender: newGender, email: newEmail, passWord: newPassWord, phone: newPhone)
//
            
//            if userNameTextField.text! == user.userName && passWordTextField.text! == user.passWord
//            {
//                 self.navigationController?.popViewController(animated: true)
//            }else
//            {
//               msg(myTitle: "錯誤!", myMessage: "輸入的姓名或密碼有誤!")
//            }
            
            
            userNameTextField.text = ""
            passWordTextField.text = ""
            
//            
//        }else
//        {
//            msg(myTitle: "不是會員!", myMessage: "請先註冊為會員!")
//            userNameTextField.text = ""
//            passWordTextField.text = ""
//        }
        
    }
    
    @IBAction func goToRegisterBtn(_ sender: UIButton) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "goToRegisterVC")as! RegisterVC
        show(vc, sender: self)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userNameTextField.resignFirstResponder()
        passWordTextField.resignFirstResponder()
        return true
    }
    
    func msg(myTitle:String,myMessage:String){
        let alertController = UIAlertController(title: myTitle, message: myMessage, preferredStyle: UIAlertControllerStyle.alert)
        let btn1 = UIAlertAction(title: "確定", style: UIAlertActionStyle.default) {(btn1)in
        }
        
        alertController.addAction(btn1)
        present(alertController, animated: false, completion: nil)
    }
    
}
