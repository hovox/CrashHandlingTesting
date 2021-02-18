//
//  ViewController.swift
//  CrashHandlingTest
//
//  Created by Hovhannes Safaryan on 15.02.21.
//

import UIKit
import FirebaseCrashlytics
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let button = UIButton(type: .roundedRect)
                button.frame = CGRect(x: 20, y: 50, width: 100, height: 30)
                button.setTitle("Crash", for: [])
                button.addTarget(self, action: #selector(self.crashButtonTapped(_:)), for: .touchUpInside)
                view.addSubview(button)
    }
    
    @IBAction func crashButtonTapped(_ sender: AnyObject) {
        CxxCrashExample();
        
        print("hello world")
//        CxxCrash2()
        
//        CxxCrashStruct()
        
//        CxxNativeWithiOSStack()
    }


}

