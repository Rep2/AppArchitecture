//
//  Repository.swift
//  AppArchitecture
//
//  Created by IN2 MacbookPro on 17/02/16.
//  Copyright © 2016 IN2. All rights reserved.
//

import Foundation

class Repository<T: WebService>{
    
    func get(webService: T, params:[String:String]? = nil, observer: (data: Any?, error: HTTPRequestError?) -> Void) -> Any?{
        
        let data = webService.get()
        
        if data == nil{
            HTTPRequestManager.instance.get(webService.route, params: params,
                observer: parseResponse(webService, observer: observer))
        }
        
        return data
    }
    
    
    private func parseResponse(webService: T, observer: (data: Any?, error: HTTPRequestError?) -> Void)(data: Any?, error: HTTPRequestError?){
        
        let data = webService.parse(data)
        
        observer(data: data, error: error)
    }
    
}