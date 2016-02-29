//
//  WebService.swift
//  AppArchitecture
//
//  Created by IN2 MacbookPro on 17/02/16.
//  Copyright © 2016 IN2. All rights reserved.
//

import Foundation

/**
 Resource handler optimized for RESTful web service
 
 Stores web service data and handles parsing to and from transmission format
*/
protocol ResourceHandler{
    
    init()
    
    /// Service endpoint route
    var route: String {get}
    
    /// Returns all stored models, if exists
    func getAll() -> [Model]?
    
    /// Returns specific model, if exists
    func get(id: Int) -> Model?
    
    /// Parses collection from transmission format to object model
    func parseCollectionToModel(data: AnyObject) -> [Model]
    
    /// Parses single entity from transmission format to object model
    func parseEntityToModel(data: [String : AnyObject]) -> Model?
    
    /// Parses from object model to transmission format
    func parseFromModel() -> Any
}

