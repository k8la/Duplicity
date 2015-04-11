//
//  LoginViewController.swift
//  Duplicity
//
//  Created by Kaitlyn on 3/13/15.
//  Copyright (c) 2015 K8La. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    

   
    @IBAction func submit(sender: UIButton) {
        
        
    }
    
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var logo: UILabel!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var submitLabel: UILabel!
    @IBAction func signup(sender: AnyObject) {
        
        logo.hidden = true
        email.hidden =  false
        password.hidden = false
        submitButton.hidden = false
        submitLabel.hidden = false
        
        
    }


    @IBAction func login(sender: AnyObject) {
        
        logo.hidden = true
        email.hidden =  false
        password.hidden = false
        submitButton.hidden = false
        submitLabel.hidden = false
    }


    func didTapView(){
        self.view.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tapRecognizer = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: "didTapView")
        self.view.addGestureRecognizer(tapRecognizer)
        
        email.hidden = true
        password.hidden = true
        submitButton.hidden = true
        submitLabel.hidden = true


        
        var user = PFUser()
        user.username = "myUsername"
        user.password = "myPassword"
        user.email = "email@example.com"
        // other fields can be set just like with PFObject

        
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if error == nil {
                // Hooray! Let them use the app now.
            } else {
//                let errorString = error.userInfo["error"] as NSString
                // Show the errorString somewhere and let the user try again.
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
