//
//  Repository.swift
//  AppArchitecture
//
//  Created by IN2 MacbookPro on 17/02/16.
//  Copyright © 2016 IN2. All rights reserved.
//

import Foundation

class Repository{
    
    /**
     Fetches all entities of a given resource.
     
     If resource does not have data stored, or refresh flag is set, fethes data from web endpoint.
     Otherwise returns stored data.
     
     - Parameter resource: ResourceHandler class which data is requested
     - Parameter params: request body parameters
     - Parameter refresh: flag which forces data refresh
     - Parameter observer: async return func
     - Returns: [Model]? stored models
    */
    static func getAll(resource: ResourceHandler, params:[String:String]? = nil, refresh: Bool = false, observer: (data: AnyObject?, error: HTTPRequestError?) -> Void) -> [Model]?{
        
        let data = resource.getAll()
        
        if data == nil || refresh{
            HTTPRequestManager.instance.get(resource.route, params: params,
                observer: parseResponse(resource, observer: observer))
            
            return nil
        }
        
        return data
    }
    
    /// Helper function. Inits resrouce handler from given name.
    static func getAll(resourceName: ResourceHandlerName, params:[String:String]? = nil, refresh: Bool = false, observer: (data: AnyObject?, error: HTTPRequestError?) -> Void) -> [Model]?{
        
        return getAll(ResourceHandlerLocator.getService(resourceName), params: params, refresh: refresh, observer: observer)
    }
    
    /**
     Fetches single resource if stored
     Else fetches resrouce from web service
    */
    static func get(resource: ResourceHandler, id: Int, params:[String:String]? = nil, refresh: Bool = false, observer: (data: AnyObject?, error: HTTPRequestError?) -> Void) -> Model?{
        
        let entity = resource.get(id)
        
        if entity == nil || refresh{
            HTTPRequestManager.instance.get(resource.route + "/\(id)", params: params,
                observer: parseResponse(resource, observer: observer))
            
            return nil
        }
        
        return entity
    }
    
    
    static private func parseResponse(resource: ResourceHandler, observer: (data: AnyObject?, error: HTTPRequestError?) -> Void)(data: AnyObject?, error: HTTPRequestError?){
        
        if let error = error{
            print(error)
            
            observer(data: nil, error: error)
        }else{
            if let data = data{
                let data = resource.parseCollectionToModel(data)
                
                observer(data: data, error: error)
            }else{
                observer(data: nil, error: HTTPRequestError.NoDataOnSuccess)
            }
        }
    }
    
    static private func parseEntityResponse(resource: ResourceHandler, observer: (data: AnyObject?, error: HTTPRequestError?) -> Void)(data: AnyObject?, error: HTTPRequestError?){
    
        if let error = error{
            print(error)
            
            observer(data: nil, error: error)
        }else{
            if let data = data as? [String:AnyObject]{
                let entity = resource.parseEntityToModel(data)
                
                observer(data: entity, error: error)
            }else{
                observer(data: nil, error: HTTPRequestError.NoDataOnSuccess)
            }
        }
    }
    
}