//
//  ViewController.swift
//  SwiftUtilExample
//
//  Created by wizard lee on 8/16/16.
//  Copyright © 2016 wizard lee. All rights reserved.
//

import UIKit
import CleanroomLogger

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Log.verbose?.message("verbose")
        Log.debug?.message("debug")
        Log.info?.message("info")
        Log.warning?.message("warning")
        Log.error?.message("error")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

