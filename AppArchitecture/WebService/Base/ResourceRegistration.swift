//
//  WebSeviceRegistration.swift
//  AppArchitecture
//
//  Created by IN2 MacbookPro on 26/02/16.
//  Copyright © 2016 IN2. All rights reserved.
//

import Foundation

let baseHTTPRoute = "http://46.101.229.117/"

/// Register any web services added to project
enum ResourceHandlerName{
    case User
}

/// After registration assign class to registered handler
let registeredResources: [ResourceHandlerName : protocol<ResourceHandler>.Type ] = [
    ResourceHandlerName.User : UserResourceHandler.self
]