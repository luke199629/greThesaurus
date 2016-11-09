//
//  SpecificList.swift
//  greThesaurus
//
//  Created by Ke Lu on 11/7/16.
//  Copyright © 2016 kelu2zhao102. All rights reserved.
//

import UIKit

class SpecificList: NSObject, NSCoding {
    var name = ""
    
    var items = [SpecificListItem]()
    
    init(name: String) {
        self.name = name
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "Name") as! String
        items = aDecoder.decodeObject(forKey: "Items") as! [SpecificListItem]
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "Name")
        aCoder.encode(items, forKey: "Items")
    }
}
