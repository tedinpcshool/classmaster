//
//  ViewController.swift
//  D 01
//
//  Created by ios135 on 2017/6/9.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nameText: UITextField!
    
    @IBAction func store(_ sender: UIButton) {
        
        self.nameData.append(nameText.text!)
        self.tableView.reloadData()
        
//        self.nameData.append(String(describing: nameText.text))
        
    }
    var datas=["專案1"]
    var nameData:Array<String>=[]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        設定自己為nameText的代理人
        self.nameText.delegate=self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameData.count
    }
    
    // 顯示表格標題
    func tableView(_ tableView: UITableView, titleForHeaderInSection section:
        Int) -> String?{
        return "頭";
    }
    // 顯示表格結尾
    func tableView(_ tableView: UITableView, titleForFooterInSection section:
        Int) -> String?{
        return "尾";
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let label1:UILabel = cell.contentView.subviews[0] as! UILabel
        label1.text=self.nameData[indexPath.row]
//        label1.text = nameText.text
//        label1.text=self.datas[indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SGVC1") as! SGVC1
        
        self.navigationController?.pushViewController(vc, animated: true)
        
        
        
    }
    
    
    func buttonClicked(sender : UIButton!) {
        print("Clicked!")
    }

    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameText.resignFirstResponder()
        return true
    }
    
    
}

