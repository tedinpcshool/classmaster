//
//  ClassDetailVC.swift
//  classmaster
//
//  Created by ios on 2017/5/15.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit
import InteractiveSideMenu

class ClassDetailVC: MenuItemContentViewController,UITableViewDelegate,UITableViewDataSource {

    
    var classModel:[ClassModel] = []
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    override func viewDidAppear(_ animated: Bool) {
        
        if classModel.count == 0
        {
            msg(myTitle: "課程規劃中!", myMessage: "尚未開課")
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classModel.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = classModel[indexPath.row].className
        cell.detailTextLabel?.text = "教練: \(classModel[indexPath.row].teacherName!), 日期: \(classModel[indexPath.row].day[0]), 時段: \(classModel[indexPath.row].time[0]),地點:\(classModel[indexPath.row].location!)\n教練: \(classModel[indexPath.row].teacherName!), 日期: \(classModel[indexPath.row].day[1]), 時段: \(classModel[indexPath.row].time[1]),地點:\(classModel[indexPath.row].location!)"
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          //indexPath.row
        
          let vc2 = storyboard?.instantiateViewController(withIdentifier: "goToDetailVC2") as! ClassDetailVC2
          vc2.classObj = self.classModel[indexPath.row]
//          self.navigationController?.pushViewController(vc2, animated: true)
//        self.navigationController?.pushViewController(vc2, animated: true)
          self.show(vc2, sender: self)
          
    }
    
    func msg(myTitle:String,myMessage:String){
        let alertController = UIAlertController(title: myTitle, message: myMessage, preferredStyle: UIAlertControllerStyle.alert)
        let btn1 = UIAlertAction(title: "取消", style: UIAlertActionStyle.default) {(btn1)in
            self.navigationController?.popViewController(animated: true)
        }
        
        alertController.addAction(btn1)
        present(alertController, animated: false, completion: nil)
    }

}
