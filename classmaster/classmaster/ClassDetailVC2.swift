//
//  ClassDetailVC2.swift
//  classmaster
//
//  Created by ios135 on 2017/5/17.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit
import InteractiveSideMenu

class ClassDetailVC2: MenuItemContentViewController {
    
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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
      override func viewDidAppear(_ animated: Bool) {
       
       
          classNameLabel.text = classObj?.className!
          zoomLabel.text = classObj?.zoom!
          categoryLabel.text = classObj?.category!
          teacherNameLabel.text = classObj?.teacherName!
          dayLabel.text = (classObj?.day[0])! + "," + (classObj?.day[1])!
          timeLabel.text = (classObj?.time[0])! + "," +  (classObj?.time[1])!
          locationLabel.text = classObj?.location!
                
    }
    
    @IBAction func signUpBtn(_ sender: UIButton) {
    }
  
    
    
}
