//
//  TestWebService.swift
//  AppArchitecture
//
//  Created by IN2 MacbookPro on 17/02/16.
//  Copyright © 2016 IN2. All rights reserved.
//

import Foundation

class TestWebService: WebService{
    
    let route = "adsads"
    
    var data: [TestModel]?
    
    func get() -> Any? {
        return data
    }
    
    func parse(data: Any) -> Any {
        return data
    }
    
}