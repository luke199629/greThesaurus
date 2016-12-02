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
    var rate = 0
    var items = [SpecificListItem]()
    
    init(name: String, rate: Int) {
        self.name = name
        self.rate = rate
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "Name") as! String
        rate = aDecoder.decodeInteger(forKey: "Rate") 
        items = aDecoder.decodeObject(forKey: "Items") as! [SpecificListItem]
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "Name")
        aCoder.encode(rate, forKey: "Rate")
        aCoder.encode(items, forKey: "Items")
    }
}
