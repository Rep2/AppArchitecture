//
//  WebSeviceRegistration.swift
//  AppArchitecture
//
//  Created by IN2 MacbookPro on 26/02/16.
//  Copyright © 2016 IN2. All rights reserved.
//

import Foundation

/// Register any web services added to project
enum WebServiceHandlerName{
    case TestWebService
}

/// Asign class to registered web service
let registeredWebServices: [WebServiceHandlerName : protocol<WebServiceHandler>.Type ] = [
    WebServiceHandlerName.TestWebService : TestWebService.self
]