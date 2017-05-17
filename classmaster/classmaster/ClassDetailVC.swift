//
//  ClassDetailVC.swift
//  classmaster
//
//  Created by ios on 2017/5/15.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit

class ClassDetailVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    var classModel:[ClassModel] = []
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        cell.detailTextLabel?.text = "教練: \(classModel[indexPath.row].teacherName!), 日期: \(classModel[indexPath.row].day[0]), 時間: \(classModel[indexPath.row].time[0])\n教練: \(classModel[indexPath.row].teacherName!), 日期: \(classModel[indexPath.row].day[1]), 時間: \(classModel[indexPath.row].time[1])"
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          //indexPath.row
        
          let vc2 = storyboard?.instantiateViewController(withIdentifier: "goToDetailVC2") as! ClassDetailVC2
          vc2.classObj = self.classModel[indexPath.row]
        self.navigationController?.pushViewController(vc2, animated: true)
//        self.navigationController?.pushViewController(vc2, animated: true)
          //self.show(vc2, sender: self)
          
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
