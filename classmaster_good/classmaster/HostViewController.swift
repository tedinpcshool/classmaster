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
    }
    
    override func menuTransitionOptionsBuilder() -> TransitionOptionsBuilder? {
        return TransitionOptionsBuilder() { builder in
            builder.duration = 0.5
            builder.contentScale = 1
        }
    }
    
    @IBAction func pushBtnToMenu(_ sender: UIBarButtonItem) {
        showMenu()
    }
    
    private func contentControllers() -> [MenuItemContentViewController] {
        
        var contentList = [MenuItemContentViewController]()
        let introClass = UIStoryboard(name: "Intro", bundle: nil)
        let nIntroVC = introClass.instantiateViewController(withIdentifier: "goToIntroVC") as! MenuItemContentViewController
            contentList.append(nIntroVC)
        
        let priceClass = UIStoryboard(name: "Price", bundle: nil)
        let nPriceVC = priceClass.instantiateViewController(withIdentifier: "goToPriceVC") as! MenuItemContentViewController
            contentList.append(nPriceVC)

        let storybordClass = UIStoryboard(name: "Class", bundle: nil)
        let nClassVC = storybordClass.instantiateViewController(withIdentifier: "classVC") as! MenuItemContentViewController
            contentList.append(nClassVC)
        
        let memberClass = UIStoryboard(name: "MemArea", bundle: nil)
//        let nMemberVC = memberClass.instantiateViewController(withIdentifier: "MemberVC") as! MenuItemContentViewController
        let nWeinVC = memberClass.instantiateViewController(withIdentifier: "goToWeinVC2") as! MenuItemContentViewController
       
            contentList.append(nWeinVC)

        
//        contentList.append(self.storyboard?.instantiateViewController(withIdentifier: "First") as! MenuItemContentViewController)
//        contentList.append(self.storyboard?.instantiateViewController(withIdentifier: "goIntroVC") as! MenuItemContentViewController)
       
        return contentList
    }
}
