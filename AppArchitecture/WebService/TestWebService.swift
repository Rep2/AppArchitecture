//
//  TestWebService.swift
//  AppArchitecture
//
//  Created by IN2 MacbookPro on 17/02/16.
//  Copyright © 2016 IN2. All rights reserved.
//

import Foundation

class TestWebService: WebServiceHandler{
    
    let route = "https://maps.googleapis.com/maps/api/distancematrix/json?language=hr-HR&key=AIzaSyDRsUm7UbjW0704uQhomf0f76ZS-9gTwB0"
    
    var data: [TestModel]?
    
    func get() -> Any? {
        return data
    }
    
    func parseToModel(data: Any) -> Any {
        print(data)
        
        return data
    }
    
    func parseFromModel() -> Any {
        return data ?? []
    }
    
}