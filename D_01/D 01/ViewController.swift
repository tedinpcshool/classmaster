//
//  ViewController.swift
//  D 01
//
//  Created by ios135 on 2017/6/9.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
//        UITableViewCell {
//            let cell=tableView.dequeueReusableCell(withIdentifier: "Cell")!
//            cell.textLabel?.text="hi"
//            cell.detailTextLabel?.text="k"
//            cell.imageView?.image=UIImage(named: "0")
//            return cell
//    }
    
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
        
        let button : UIButton = UIButton(type:UIButtonType.custom) as UIButton
        
        button.frame = CGRect(origin: CGPoint(x: 40,y :60), size: CGSize(width: 100, height: 24))
        let cellHeight: CGFloat = 44.0
        button.center = CGPoint(x: view.bounds.width / 2.0, y: cellHeight / 2.0)
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(buttonClicked), for: UIControlEvents.touchUpInside)
        button.setTitle(" 加專案!", for: UIControlState.normal)
        
        cell.addSubview(button)
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

    
    @IBOutlet weak var button1: UIButton!
    
    @IBAction func button1(_ sender: Any) {
                                            }
    

}

