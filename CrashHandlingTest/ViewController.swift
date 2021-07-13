//
//  ViewController.swift
//  CrashHandlingTest
//
//  Created by Hovhannes Safaryan on 15.02.21.
//

import UIKit
import FirebaseCrashlytics
import Firebase
import RCBacktrace

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let button = UIButton(type: .roundedRect)
                button.frame = CGRect(x: 20, y: 50, width: 100, height: 30)
                button.setTitle("Crash", for: [])
//                button.addTarget(self, action: #selector(self.crashButtonTapped), for: .touchUpInside)
        button.addTarget(self, action: #selector(tapTest), for: .touchUpInside)

                view.addSubview(button)
    }
    
    @objc func tapTest() {
        DispatchQueue.global().async {
            let symbols = RCBacktrace.callstack(.main)
            for symbol in symbols {
                print(symbol.description)
            }
        }

        foo()
    }
    
    @objc func crashButtonTapped() {
//        CxxCrashExample();
        
        print("hello world")
        
        
//        CxxCrash2()
        
//        CxxCrashStruct()
        
//        CxxNativeWithiOSStack()
        
//        let a: MyCrashingCls = MyCrashingCls()
//        print(a)
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            let symbols = RCBacktrace.callstack(.main)
            var stackTrace:Array<StackFrame> = []
            for symbol in symbols {
                print(symbol.description)
                let stackFrame = StackFrame(address: symbol.symbolAddress)
                stackTrace.append(stackFrame)
            }
            let exModel = ExceptionModel(name: "app.hang", reason: "hang")
            exModel.stackTrace = stackTrace
            Crashlytics.crashlytics().record(exceptionModel: exModel)
        }

        foo()
        
    }
    
    func foo() {
        bar()
    }

    func bar() {
        baz()
    }

    func baz() {
        while true {

        }
    }


}

