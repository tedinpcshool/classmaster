//
//  UserInfo.swift
//  classmaster
//
//  Created by 黃威淵 on 2017/6/2.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import Foundation

class UserInfo:NSObject{

    var userName:String?
    var gender:String?
    var email:String?
    var passWord:String?
    var phone:String?
    var selectClass:[ClassModel]?
    
    init(userName:String,gender:String,email:String,passWord:String,phone:String) {
        self.userName = userName
        self.gender = gender
        self.email = email
        self.passWord = passWord
        self.phone = phone
//        self.selectClass = selectClass
        
    }
    
    
    required init(coder decoder: NSCoder) {
        self.userName = decoder.decodeObject(forKey: "userName") as? String ?? ""
        self.gender = decoder.decodeObject(forKey: "gender") as? String ?? ""
        self.email = decoder.decodeObject(forKey: "email") as? String ?? ""
        self.passWord = decoder.decodeObject(forKey: "passWord") as? String ?? ""
        self.phone = decoder.decodeObject(forKey: "phone") as? String ?? ""
//        self.selectClass = decoder.decodeObject(forKey: "selectClass") as? [ClassModel] ?? nil
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(userName, forKey:"userName")
        coder.encode(gender, forKey:"gender")
        coder.encode(email, forKey:"email")
        coder.encode(passWord, forKey:"passWord")
        coder.encode(phone, forKey:"Phone")
//        coder.encode(selectClass, forKey:"selectClass")
    }
    
    


}
