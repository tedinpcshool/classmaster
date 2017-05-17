//
//  ClassModel.swift
//  classmaster
//
//  Created by ios on 2017/5/15.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit

class ClassModel: NSObject {
    var className:String?
    var teacherName:String?
    var zoom:String?
    var time:[String]
    var day:[String]
    var category:String?
    var category_id:Int?
    
    init(className:String,teacherName:String,zoom:String,time:[String],day:[String],category:String,category_id:Int) {
        self.className = className
        self.teacherName = teacherName
        self.zoom = zoom
        self.time = time
        self.day = day
        self.category = category
        self.category_id = category_id
    }
    
    
}
