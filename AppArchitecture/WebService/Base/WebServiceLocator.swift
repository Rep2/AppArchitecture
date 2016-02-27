//
//  WebServiceLocator.swift
//  AppArchitecture
//
//  Created by IN2 MacbookPro on 25/02/16.
//  Copyright © 2016 IN2. All rights reserved.
//

import Foundation

/// Locates registered web services
class WebServiceHandlerLocator{
    
    /// Stores initialized web services
    static var initializedWebServices = [WebServiceHandlerName : WebServiceHandler?]()
    
    /// Returns requested web service. Initializes it if needed
    static func getService(webService: WebServiceHandlerName) -> WebServiceHandler{
        
        if let handler = initializedWebServices[webService]{
            if let handler = handler{
                return handler
            }
        }
        
        let handler = registeredWebServices[webService]!.init()
        initializedWebServices[webService] = handler
        
        return handler
    }
    
}