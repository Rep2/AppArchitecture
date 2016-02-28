//
//  Repository.swift
//  AppArchitecture
//
//  Created by IN2 MacbookPro on 17/02/16.
//  Copyright © 2016 IN2. All rights reserved.
//

import Foundation

class Repository{
    
    static func getAll(resource: ResourceHandler, params:[String:String]? = nil, refresh: Bool = false, observer: (data: Any?, error: HTTPRequestError?) -> Void) -> Any?{
        
        let data = resource.getAll()
        
        if data == nil || refresh{
            HTTPRequestManager.instance.get(resource.route, params: params,
                observer: parseResponse(resource, observer: observer))
        }
        
        return data
    }
    
    static func get(resource: ResourceHandler, id: Int, params:[String:String]? = nil, refresh: Bool = false, observer: (data: Any?, error: HTTPRequestError?) -> Void) -> Any?{
        
        let entity = resource.get(id)
        
        if entity == nil || refresh{
            HTTPRequestManager.instance.get(resource.route + "/\(id)", params: params,
                observer: parseResponse(resource, observer: observer))
        }
        
        return entity
    }
    
    
    static private func parseResponse(resource: ResourceHandler, observer: (data: Any?, error: HTTPRequestError?) -> Void)(data: Any?, error: HTTPRequestError?){
        
        let data = resource.parseCollectionToModel(data)
        
        observer(data: data, error: error)
    }
    
    static private func parseEntityResponse(resource: ResourceHandler, observer: (data: Any?, error: HTTPRequestError?) -> Void)(data: Any?, error: HTTPRequestError?){
    
        let entity = resource.parseEntityToModel(data as? [String:Any] ?? [:])
        
        observer(data: entity, error: error)
    }
    
}