////
////  LoginViewController.swift
////  Duplicity
////
////  Created by Kaitlyn on 3/13/15.
////  Copyright (c) 2015 K8La. All rights reserved.
////
//
//import UIKit
//
//class LoginViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
//    
//    var signupActive = true
//    
//    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
//    
//    func displayAlert(title:String, error:String) {
//        
//        var alert = UIAlertController(title: title, message: error, preferredStyle: UIAlertControllerStyle.Alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { action in
//            
//            self.dismissViewControllerAnimated(true, completion: nil)
//            
//        }))
//        
//        self.presentViewController(alert, animated: true, completion: nil)
//        
//    }
//    
//    
//
//    
//    @IBOutlet weak var username: UITextField!
//    
//    @IBOutlet weak var password: UITextField!
//    
//    
//    @IBOutlet weak var signUpButton: UIButton!
//    
//    @IBOutlet weak var signIn: UIButton!
//    
//    
//    
//    
//
//
//    
//    
//    @IBOutlet var alreadyRegistered: UILabel!
//    
//    @IBOutlet var signUpButton: UIButton!
//    
//    @IBOutlet var signUpLabel: UILabel!
//    
//    @IBOutlet var signUpToggleButton: UIButton!
//    
//    @IBAction func toggleSignUp(sender: AnyObject) {
//        
//        if signupActive == true {
//            
//            signupActive = false
//            
//            signUpLabel.text = "Use the form below to log in"
//            
//            signUpButton.setTitle("Log In", forState: UIControlState.Normal)
//            
//            alreadyRegistered.text = "Not Registered?"
//            
//            signUpToggleButton.setTitle("Sign Up", forState: UIControlState.Normal)
//            
//            
//        } else {
//            
//            signupActive = true
//            
//            signUpLabel.text = "Use the form below to sign up"
//            
//            signUpButton.setTitle("Sign Up", forState: UIControlState.Normal)
//            
//            alreadyRegistered.text = "Already Registered?"
//            
//            signUpToggleButton.setTitle("Log In", forState: UIControlState.Normal)
//            
//            
//        }
//        
//        
//    }
//    
//    @IBAction func signUp(sender: AnyObject) {
//        
//        var error = ""
//        
//        if username.text == "" || password.text == "" {
//            
//            error = "Please enter a username and password"
//            
//        }
//        
//        
//        if error != "" {
//            
//            displayAlert("Error In Form", error: error)
//            
//        } else {
//            
//            
//            
//            activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 50, 50))
//            activityIndicator.center = self.view.center
//            activityIndicator.hidesWhenStopped = true
//            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
//            view.addSubview(activityIndicator)
//            activityIndicator.startAnimating()
//            UIApplication.sharedApplication().beginIgnoringInteractionEvents()
//            
//            if signupActive == true {
//                
//                var user = PFUser()
//                user.username = username.text
//                user.password = password.text
//                
//                user.signUpInBackgroundWithBlock {
//                    (succeeded: Bool, signupError: NSError) -> Void in
//                    
//                    self.activityIndicator.stopAnimating()
//                    UIApplication.sharedApplication().endIgnoringInteractionEvents()
//                    
//                    if signupError == nil  {
//                        // Hooray! Let them use the app now.
//                        
//                        println("signed up")
//                        
//                        self.performSegueWithIdentifier("jumpToUserTable", sender: "self")
//                        
//                        
//                    } else {
//                        
//                        if let errorString = signupError.userInfo!["error"] as? NSString {
//                            
//                            error = errorString as! String
//                            
//                        } else {
//                            
//                            error = "Please try again later."
//                            
//                        }
//                        
//                        self.displayAlert("Could Not Sign Up", error: error)
//                        
//                    }
//                }
//                
//            } else {
//                
//                PFUser.logInWithUsernameInBackground(username.text, password:password.text) {
//                    (user: PFUser!, signupError: NSError!) -> Void in
//                    
//                    
//                    self.activityIndicator.stopAnimating()
//                    UIApplication.sharedApplication().endIgnoringInteractionEvents()
//                    
//                    if signupError == nil {
//                        
//                        self.performSegueWithIdentifier("jumpToUserTable", sender: "self")
//                        
//                        println("logged in")
//                        
//                    } else {
//                        
//                        if let errorString = signupError.userInfo?["error"] as? NSString {
//                            
//                            error = errorString as! String
//                            
//                        } else {
//                            
//                            error = "Please try again later."
//                            
//                        }
//                        
//                        self.displayAlert("Could Not Log In", error: error)
//                        
//                        
//                    }
//                }
//                
//                
//            }
//            
//            
//        }
//        
//        
//    }
//
//    
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        
//        var user = PFUser()
//        user.username = "myUsername"
//        user.password = "myPassword"
//        user.email = "email@example.com"
//        // other fields can be set just like with PFObject
//
//        
//        user.signUpInBackgroundWithBlock {
//            (succeeded: Bool, error: NSError?) -> Void in
//            if error == nil {
//                // Hooray! Let them use the app now.
//            } else {
//                let errorString = error.userInfo["error"] as NSString
//                // Show the errorString somewhere and let the user try again.
//            }
//        }
//        
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//}
