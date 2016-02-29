//
//  HTTPRequestManagerTest.swift
//  AppArchitecture
//
//  Created by Rep on 2/28/16.
//  Copyright © 2016 IN2. All rights reserved.
//

import XCTest
@testable import AppArchitecture

class HTTPRequestManagerTest: XCTestCase{
    
    let resourceURL = "http://46.101.229.117/user"
    
    // Returns data on success
    func testSimpleSuccessfulGet(){
        
        let expect = expectationWithDescription("Web sevice response")
    
        HTTPRequestManager.instance.get(resourceURL)
            {
            (data, error) -> Void in
                assert(data != nil)
                assert(error == nil)
                
                expect.fulfill()
            }
        
        waitForExpectationsWithTimeout(10) { (error) -> Void in
            assert(error == nil, "SimpleSuccessfulGet timeout")
        }
    }

    
    // Return error on failure
    func testSimpleFailGet(){
        let expect = expectationWithDescription("Web sevice response")
        
        HTTPRequestManager.instance.get(resourceURL + "asdas")
            {
                (data, error) -> Void in
                assert(data == nil)
                assert(error != nil)
                
                expect.fulfill()
            }
        
        waitForExpectationsWithTimeout(10) { (error) -> Void in
            assert(error == nil, "SimpleFailGet timeout")
        }
    }
    
    // Tests collection get
    func testCollectionGet(){
        let expect = expectationWithDescription("Web sevice response")
        
        HTTPRequestManager.instance.get(resourceURL)
            {
                (data, error) -> Void in
                
                assert(data is [[String:AnyObject]])
    
                expect.fulfill()
        }
        
        waitForExpectationsWithTimeout(10) { (error) -> Void in
            assert(error == nil, "CollectionGet timeout")
        }
    }
    
    // Tests get
    func testSingleGet(){
        let expect = expectationWithDescription("Web sevice response")
        
        HTTPRequestManager.instance.get(resourceURL + "/5")
            {
                (data, error) -> Void in
                
                assert(data is [String:AnyObject])
                
                expect.fulfill()
        }
        
        waitForExpectationsWithTimeout(10) { (error) -> Void in
            assert(error == nil, "CollectionGet timeout")
        }
    }
    
    // Test HTTP response on no internet
    // WILL FAIL IF INTERNET CONNECTION EXISTS
   /* func testNoInternet(){
        let expect = expectationWithDescription("Web sevice response")
        
        HTTPRequestManager.instance.get(resourceURL + "/5")
            {
                (data, error) -> Void in
                
                assert(error != nil)
                
                do{
                    throw error!
                }catch HTTPRequestError.NoInternetConnection{
                    assert(true)
                }catch{
                    assert(false)
                }
                
                
                expect.fulfill()
        }
        
        waitForExpectationsWithTimeout(10) { (error) -> Void in
            assert(error == nil, "CollectionGet timeout")
        }
    }*/
    
 
    
    
    
}