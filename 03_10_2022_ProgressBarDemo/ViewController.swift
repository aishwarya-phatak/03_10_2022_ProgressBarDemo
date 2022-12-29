//
//  ViewController.swift
//  03_10_2022_ProgressBarDemo
//
//  Created by Vishal Jagtap on 29/12/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var emailIdTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginProgressView: UIProgressView!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var progressViewLabel: UILabel!
    
    let progress = Progress(totalUnitCount: 10)
    var ratio : Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        loginProgressView.isHidden = true
        ratio = 0
        loginProgressView.progress = ratio!
        
        loginProgressView.layer.cornerRadius = 6
        
        loginButton.layer.cornerRadius = 7
        progressViewLabel.isHidden = true
    }

    @IBAction func loginButtonClicked(_ sender: Any) {
        var userName = userNameTextField.text
        var emailId = emailIdTextField.text
        var password = passwordTextField.text
        
        if(userName != "" && emailId != "" && password != ""){
            loginButton.isHidden = true
            loginProgressView.isHidden = false
            progressViewLabel.isHidden = false
            
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
                guard self.progress.isFinished == false else{
                    timer.invalidate()
                    return
                }
                
                self.progress.completedUnitCount += 1
                let progressFloat = Float(self.progress.fractionCompleted)
                self.loginProgressView.setProgress(progressFloat, animated: true)
                self.progressViewLabel.text = String(progressFloat)
            }
        }
    }
}
