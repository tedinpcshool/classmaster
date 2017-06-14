//
//  SGVC1.swift
//  D 01
//
//  Created by ios135 on 2017/6/9.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit

class SGVC1: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var datas = ["成員1"]
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func pushBtn(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let label1:UILabel = cell.contentView.subviews[0] as! UILabel
        
        label1.text=self.datas[indexPath.row]
        return cell
        }
    
    
    @IBAction func addmemBtn(_ sender: UIButton) {
        self.datas.append("成員"+String(datas.count+1))
        self.tableView.reloadData()

    }
    
    
}
