//
//  ResourceLocatorTest.swift
//  AppArchitecture
//
//  Created by Rep on 2/28/16.
//  Copyright © 2016 IN2. All rights reserved.
//

import XCTest
@testable import AppArchitecture

class ResourceLocatorTest: XCTestCase{
    
    func testLocator(){
        
        let userResourceHandler = ResourceHandlerLocator.getService(.User)
     
        assert(userResourceHandler.getAll() != nil)
        
    }
    
}