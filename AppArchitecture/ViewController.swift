//
//  ViewController.swift
//  AppArchitecture
//
//  Created by IN2 MacbookPro on 12/02/16.
//  Copyright © 2016 IN2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var data = Repository.get(
            WebServiceLocator.getService(WebServiceName.TestWebService),
            observer: handle)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handle(data: Any?, error: HTTPRequestError?){
        print(data)
    }


}

