//
//  SpecificListItem.swift
//  greThesaurus
//
//  Created by Ke Lu on 11/8/16.
//  Copyright © 2016 kelu2zhao102. All rights reserved.
//

import Foundation
class SpecificListItem: NSObject, NSCoding {
    var word = ""
    var expl = ""
    var rating = 0
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(word, forKey: "Word")
        aCoder.encode(expl, forKey: "Explanation")
        aCoder.encode(rating, forKey: "Rating")
    }
    
    required init?(coder aDecoder: NSCoder) {
        word = aDecoder.decodeObject(forKey: "Word") as! String
        expl = aDecoder.decodeObject(forKey: "Explanation") as! String
        rating = aDecoder.decodeInteger(forKey: "Rating")
        super.init()
    }
    
    override init() {
        super.init()
    }
}
