//
//  ClassVC.swift
//  classmaster
//
//  Created by ios on 2017/5/15.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit
import SwiftyJSON
class ClassVC: UIViewController {
    
    
    @IBOutlet weak var categoryBtn: UIButton!

    var classModel:[ClassModel] = []
    var dict:Dictionary<String, String>!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getJsonToArys()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getJsonToArys()
    {
        let filePath=Bundle.main.path(forResource: "class", ofType:
            "json")
        let data1:Data
        let json_parsed:JSON
        do{
            try data1 = Data(contentsOf: URL(fileURLWithPath:
                filePath!, isDirectory: false))
             try json_parsed = JSON(data: data1)
//            print(json_parsed)
            if let myClass = json_parsed.array
            {
                for nClass in myClass
                {
                    let cn = nClass["className"].string
                    let tn = nClass["teacherName"].string
                    let zm = nClass["zoom"].string
                    let tiAry = nClass["time"].arrayObject
                    let dayAry = nClass["day"].arrayObject
                    let ca = nClass["category"].string
                    let caID = nClass["category_id"].int
                    let classObj = ClassModel(className: cn!, teacherName: tn!, zoom: zm!, time: tiAry as! [String], day: dayAry as! [String], category: ca!,category_id:caID!)
                    self.classModel.append(classObj)
                    
                }
//                print(classModel)
                
            }
            
            
        }catch{
            print("error:"+error.localizedDescription)
        }

        
        
        
        
    }
   
    @IBAction func categoryClick(_ sender: UIButton) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "goToDetailVC") as! ClassDetailVC
        var ary:[ClassModel]=[]
        for classobj in self.classModel {
            if classobj.category_id==sender.tag {
                ary.append(classobj)
                print(ary)
            }
        }
       
        vc.classModel = ary
        
        show(vc, sender: self)
        
    }
 
    
    
    
        
    
    

}
