//
//  TestModel.swift
//  AppArchitecture
//
//  Created by IN2 MacbookPro on 17/02/16.
//  Copyright © 2016 IN2. All rights reserved.
//

import Foundation

class Model{

}

class UserModel : Model{
    let id: Int
    let email: String
    
    init(id: Int, email: String){
        self.id = id
        self.email = email
    }
}