//
//  ClassDetailVC2.swift
//  classmaster
//
//  Created by ios135 on 2017/5/17.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit

class ClassDetailVC2: UIViewController {
    
    @IBOutlet weak var classNameLabel: UILabel!
    @IBOutlet weak var zoomLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var teacherNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    

    var classObj:ClassModel?
    override func viewDidLoad() {
        super.viewDidLoad()
               // Do any additional setup after loading the view.
        //classNameLabel.text="abbc"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
      override func viewDidAppear(_ animated: Bool) {
       
        
        classNameLabel.text = classObj?.className!
        print(classNameLabel.text!)
        

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
