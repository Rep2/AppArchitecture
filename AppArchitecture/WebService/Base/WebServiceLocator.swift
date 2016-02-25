//
//  WebServiceLocator.swift
//  AppArchitecture
//
//  Created by IN2 MacbookPro on 25/02/16.
//  Copyright © 2016 IN2. All rights reserved.
//

import Foundation

enum WebServiceHandlerName{
    case TestWebService
}

class WebServiceHandlerLocator{
    
    static let registeredWebServices: [WebServiceHandlerName : protocol<WebServiceHandler>.Type ] = [
        WebServiceHandlerName.TestWebService : TestWebService.self
    ]
    
    static var initializedWebServices: [WebServiceHandlerName : WebServiceHandler?] = [:]()
    
    static func getService(webService: WebServiceHandlerName) -> WebServiceHandler{
        return registeredWebServices[webService]!
    }
    
}