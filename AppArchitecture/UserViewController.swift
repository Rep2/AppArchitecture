//
//  ViewController.swift
//  AppArchitecture
//
//  Created by IN2 MacbookPro on 12/02/16.
//  Copyright © 2016 IN2. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var table: BasicTable!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let data = Repository.getAll(ResourceHandlerName.User, observer: handle){
            setCells(data)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func handle(data: Any?, error: HTTPRequestError?){

        if let data = data as? [Model]{
            setCells(data)
        }
    }
    
    func setCells(data: [Model]){
        
        var cells = [CellModel]()
        
        for entity in data{
            if let entity = entity as? UserModel{
                cells.append(
                    CellModel(
                        cellIdentifier: CellIdentifiers.TwoLabelRightDetail.rawValue,
                        data: [CellElementIdentifiers.FirstLabel : String(entity.id),
                            CellElementIdentifiers.SecondLabel: entity.email]
                    ))
            }
        }
        
        table.sections = [CellSection(title: nil, cells: cells)]
        table.reloadData()
    }


}

