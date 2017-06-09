//
//  WeinVC1.swift
//  classmaster
//
//  Created by 黃威淵 on 2017/5/25.
//  Copyright © 2017年 pcschool. All rights reserved.
//

import UIKit
import Firebase

import GoogleSignIn
class WeinVC1: UIViewController,GIDSignInUIDelegate {
    
     @IBOutlet weak var signInButton: GIDSignInButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func pushBtn(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
            if Auth.auth().currentUser != nil{
            
                 print(Auth.auth().currentUser?.email as Any)
            }else
            {
                 GIDSignIn.sharedInstance().signIn()
            }
        case 2:
            let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
            } catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
            
        default:
            break
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        // ...
        if let error = error {
            // ...
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                     accessToken: authentication.accessToken)
        // ...
        
        Auth.auth().signIn(with: credential) { (user, error) in
            // ...
            if let error = error {
                // ...
                return
            }
           print(user)
       }
  }
}
