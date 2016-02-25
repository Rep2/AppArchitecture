//
//  WebService.swift
//  AppArchitecture
//
//  Created by IN2 MacbookPro on 17/02/16.
//  Copyright © 2016 IN2. All rights reserved.
//

import Foundation

/**
 Web service call handler
 
 Stores web service data and handles parsing to and from transmission format
*/
protocol WebServiceHandler{
    
    /// Service endpoint route
    var route: String {get}
    
    /// Returns stored data, if exists
    func get() -> Any?
    
    /// Parses from transmission format to object model
    func parseToModel(data: Any) -> Any
    
    /// Parses from object model to transmission format
    func parseFromModel() -> Any
}

