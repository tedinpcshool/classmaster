//
// HostViewController.swift
//
// Copyright 2017 Handsome LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import UIKit
import InteractiveSideMenu

class HostViewController: MenuContainerViewController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        menuViewController = self.storyboard!.instantiateViewController(withIdentifier: "NavigationMenu") as! MenuViewController
        
        contentViewControllers = contentControllers()
        
        selectContentViewController(contentViewControllers.first!)
        self.title="AAA"
    }
    
    override func menuTransitionOptionsBuilder() -> TransitionOptionsBuilder? {
        return TransitionOptionsBuilder() { builder in
            builder.duration = 0.5
            builder.contentScale = 1
            
            
            print("test")
            
            
        }
    }
    
    private func contentControllers() -> [MenuItemContentViewController] {
        var contentList = [MenuItemContentViewController]()
        

        
        let storyboardIntro = UIStoryboard(name: "Intro", bundle: nil)
        let introVC = storyboardIntro.instantiateViewController(withIdentifier: "IntroVC") as! MenuItemContentViewController
        
       
        
        let storyboardClass = UIStoryboard(name: "Class", bundle: nil)
        let classVC2 = storyboardClass.instantiateViewController(withIdentifier: "classVC") as! MenuItemContentViewController
        
        let  storyboardPrice = UIStoryboard(name: "Price", bundle: nil)
        let priceVC = storyboardPrice.instantiateViewController(withIdentifier: "PriceVC") as! MenuItemContentViewController
        
        let storyboardMemArea = UIStoryboard(name: "MemArea", bundle: nil)
        let MemAreaVC = storyboardMemArea.instantiateViewController(withIdentifier: "MAVC") as! MenuItemContentViewController
        
        
        
        contentList.append(introVC)
        contentList.append(priceVC)
        contentList.append(classVC)
        contentList.append(MemAreaVC)
//        contentList.append(self.storyboard?.instantiateViewController(withIdentifier: "Second") as! MenuItemContentViewController)
        return contentList
    }
}
