//
//  TestWebService.swift
//  AppArchitecture
//
//  Created by IN2 MacbookPro on 17/02/16.
//  Copyright © 2016 IN2. All rights reserved.
//

import Foundation

class UserResourceHandler: ResourceHandler{
    
    let route = baseHTTPRoute + "user"
    
    var storedModels: [UserModel]?
    
    required init(){
        
    }
    
    func getAll() -> [Model]? {
        return storedModels
    }
    
    func get(id: Int) -> Model? {
        if let models = storedModels{
            return models.filter({$0.id == id}).first
        }
        
        return nil
    }
    
    func parseCollectionToModel(data: AnyObject) -> [Model] {
        if storedModels == nil{
            storedModels = []
        }
      
        if let dataArray = data as? [[String : AnyObject]]{
       
            for entity in dataArray{
                let parsedEntity = parseEntityToModel(entity)
                
                if let parsedEntity = parsedEntity as? UserModel{
                    storedModels!.append(parsedEntity)
                }
            }
        }
      
        return storedModels!
    }
    
    func parseEntityToModel(data: [String : AnyObject]) -> Model?{
        
        let user = UserModel(
            id: data["id"] as? Int ?? -1,
            email: data["email"] as? String ?? ""
        )
        
        return user
    }
    
    func parseFromModel() -> Any {
        return storedModels ?? []
    }
    
}