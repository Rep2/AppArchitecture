//
//  WebService.swift
//  AppArchitecture
//
//  Created by IN2 MacbookPro on 17/02/16.
//  Copyright © 2016 IN2. All rights reserved.
//

import Foundation

protocol WebService{
    
    var route: String {get}
    
    func get() -> Any?
    
    func parse(data: Any) -> Any
    
}

enum WebServiceName{
    case TestWebService
}

class WebServiceLocator{
    
    let registeredWebServices: [WebServiceName : WebService] = [
        WebServiceName.TestWebService : TestWebService()
    ]
    
    func getService(webService: WebServiceName) -> WebService{
        return registeredWebServices[webService]!
    }
    
}