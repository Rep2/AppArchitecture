//
//  WebServiceLocator.swift
//  AppArchitecture
//
//  Created by IN2 MacbookPro on 25/02/16.
//  Copyright © 2016 IN2. All rights reserved.
//

import Foundation

/// Locates registered web services
class ResourceHandlerLocator{
    
    /// Stores initialized web services
    static var initializedResources = [ResourceHandlerName : ResourceHandler?]()
    
    /// Returns requested web service. Initializes it if needed
    static func getService(resource: ResourceHandlerName) -> ResourceHandler{
        
        if let handler = initializedResources[resource]{
            if let handler = handler{
                return handler
            }
        }
        
        let handler = registeredResources[resource]!.init()
        initializedResources[resource] = handler
        
        return handler
    }
    
}