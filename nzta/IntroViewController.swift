//
//  IntroViewController.swift
//  nzta
//
//  Created by Ramesh Kolamala on 24/06/16.
//  Copyright © 2016 tokkalo.com. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {
    let prefs = UserDefaults.standard
    
    @IBOutlet var lblText1: UILabel!
    @IBOutlet var lblText2: UILabel!
    @IBOutlet var lblText3: UILabel!
    @IBOutlet var lblText4: UILabel!
    @IBOutlet var lblText5: UILabel!
    @IBOutlet var lblText6: UILabel!
    @IBOutlet var lblText7: UILabel!
    @IBOutlet var circleView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.circleView.layer.cornerRadius = self.circleView.frame.size.width / 2;
        self.circleView.clipsToBounds = true
        
        self.lblText1.alpha=0;
        self.lblText2.alpha=0;
        self.lblText3.alpha=0;
        self.lblText4.alpha=0;
        self.lblText5.alpha=0;
        self.lblText6.alpha=0;
        self.lblText7.alpha=0;

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //myImageView.center.x = myImageView.center.x  - self.view.frame.width
        //lblText1.frame = CGRect(x: lblText1.center.x, y: lblText1.center.y, width: 0, height: 0)
        self.circleView.frame = CGRect(x: self.circleView.frame.origin.x, y: self.circleView.frame.origin.y, width: 0, height: 0)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        if prefs.string(forKey: "login") != nil{
            self.performSegue(withIdentifier: "introToMember", sender: self)
        }else{
        self.navigationController?.isNavigationBarHidden = true
        /*UIView.animateWithDuration(2, delay: 1, options: [.Repeat,.Autoreverse], animations: { () -> Void in
            self.lblText1.frame = CGRect(x: self.lblText1.center.x, y: self.lblText1.center.y, width: 200, height: 200)
        }) { (_) -> Void in
            print("Completion")
        }*/
        
        //let rotationAngleInRadians = 180.0 * CGFloat(M_PI/180.0)
        //let rotationTransform = CATransform3DMakeRotation(rotationAngleInRadians, 0, 0, 1)
        //let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 100, 0)
        
        //self.lblText1.layer.transform = rotationTransform
        /*self.lblText2.layer.transform = rotationTransform
        // Define the final state (After the animation)
        
        UIView.animateWithDuration(1.0, animations: {
            //self.lblText1.layer.transform = CATransform3DIdentity
        })
        
        self.lblText2.layer.transform = rotationTransform
        UIView.animateWithDuration(1.0, animations: {
            self.lblText2.layer.transform = CATransform3DIdentity
            
        })*/
        
        /*self.lblText1.layer.transform = rotationTransform
        self.lblText2.layer.transform = rotationTransform
        self.lblText3.layer.transform = rotationTransform
        self.lblText4.layer.transform = rotationTransform
        self.lblText5.layer.transform = rotationTransform
        self.lblText6.layer.transform = rotationTransform
        self.lblText7.layer.transform = rotationTransform*/
        
        UIView.animate(withDuration: 2, delay: 1, options: [], animations: { () -> Void in
            
            self.circleView.frame = CGRect(x: self.circleView.frame.origin.x, y: self.circleView.frame.origin.y, width: 250, height: 250)
        }) { (_) -> Void in
            //print("Completion1")
            UIView.animate(withDuration: 2, delay: 1, options: [], animations: { () -> Void in
                self.lblText1.alpha = 1.0
            }) { (_) -> Void in
                //print("Completion1")
                UIView.animate(withDuration: 2, delay: 1, options: [], animations: { () -> Void in
                    self.lblText1.layer.transform = CATransform3DIdentity
                }) { (_) -> Void in
                    //print("Completion")
                    
                    UIView.animate(withDuration: 2, delay: 1, options: [], animations: { () -> Void in
                        self.lblText1.alpha = 0
                        self.lblText2.alpha = 1.0
                    }) { (_) -> Void in
                        //print("Completion")
                        UIView.animate(withDuration: 2, delay: 1, options: [], animations: { () -> Void in
                            self.lblText2.layer.transform = CATransform3DIdentity
                        }) { (_) -> Void in
                            //print("Completion")
                            UIView.animate(withDuration: 2, delay: 1, options: [], animations: { () -> Void in
                                self.lblText2.alpha = 0
                                self.lblText3.alpha = 1.0
                            }) { (_) -> Void in
                                //print("Completion")
                                UIView.animate(withDuration: 2, delay: 1, options: [], animations: { () -> Void in
                                    self.lblText3.layer.transform = CATransform3DIdentity
                                }) { (_) -> Void in
                                    //print("Completion")
                                    UIView.animate(withDuration: 2, delay: 1, options: [], animations: { () -> Void in
                                        self.lblText3.alpha = 0
                                        self.lblText4.alpha = 1.0
                                    }) { (_) -> Void in
                                        //print("Completion")
                                        UIView.animate(withDuration: 2, delay: 1, options: [], animations: { () -> Void in
                                            self.lblText4.layer.transform = CATransform3DIdentity
                                        }) { (_) -> Void in
                                            //print("Completion")
                                            UIView.animate(withDuration: 2, delay: 1, options: [], animations: { () -> Void in
                                                self.lblText4.alpha = 0
                                                self.lblText5.alpha = 1.0
                                            }) { (_) -> Void in
                                                //print("Completion")
                                                UIView.animate(withDuration: 2, delay: 1, options: [], animations: { () -> Void in
                                                    self.lblText5.layer.transform = CATransform3DIdentity
                                                }) { (_) -> Void in
                                                    //print("Completion")
                                                    UIView.animate(withDuration: 2, delay: 1, options: [], animations: { () -> Void in
                                                        self.lblText5.alpha = 0
                                                        self.lblText6.alpha = 1.0
                                                    }) { (_) -> Void in
                                                        //print("Completion")
                                                        UIView.animate(withDuration: 2, delay: 1, options: [], animations: { () -> Void in
                                                            self.lblText6.layer.transform = CATransform3DIdentity
                                                        }) { (_) -> Void in
                                                            //print("Completion")
                                                            UIView.animate(withDuration: 2, delay: 1, options: [], animations: { () -> Void in
                                                                self.lblText6.alpha = 0
                                                                self.lblText7.alpha = 1.0
                                                            }) { (_) -> Void in
                                                                //print("Completion")
                                                                UIView.animate(withDuration: 2, delay: 1, options: [], animations: { () -> Void in
                                                                    self.lblText7.layer.transform = CATransform3DIdentity
                                                                }) { (_) -> Void in
                                                                    //print("Completion")
                                                                    UIView.animate(withDuration: 2, delay: 1, options: [], animations: { () -> Void in
                                                                        self.lblText7.alpha = 0
                                                                    }) { (_) -> Void in
                                                                        //print("Completion")
                                                                        UIView.animate(withDuration: 2, delay: 1, options: [], animations: { () -> Void in
                                                                            self.circleView.frame = CGRect(x: self.circleView.frame.origin.x, y: self.circleView.frame.origin.y, width: 0, height: 0)
                                                                        }) { (_) -> Void in
                                                                            //print("Completion")
                                                                            self.navigationController?.isNavigationBarHidden = false
                                                                            self.performSegue(withIdentifier: "introToMain", sender: self)
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            }
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
