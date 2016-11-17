//
//  HomeViewController.swift
//  greThesaurus
//
//  Created by zhao yuanyuan on 11/16/16.
//  Copyright © 2016 kelu2zhao102. All rights reserved.
//

import Foundation
import UIKit
class HomeViewController: UIViewController {
    let wordControllerId = "wordViewController"
    var wordData:NSArray!
    var explData:NSArray!
    @IBOutlet weak var wordOfTheDayLabel: UILabel!
    var ratingData:NSArray!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let path = Bundle.main.path(forResource: "lexicon", ofType: "plist") {
            wordData = NSArray(contentsOfFile: path)!
        }
        if let path1 = Bundle.main.path(forResource: "expl", ofType: "plist") {
            explData = NSArray(contentsOfFile: path1)!
        }
        if let path2 = Bundle.main.path(forResource: "ratings", ofType: "plist") {
            ratingData = NSArray(contentsOfFile: path2)!
        }
        
        
    }
    
    
    @IBAction func didClickWordofDay(_ sender: Any) {
        
        let count = wordData.count
        let randIndex = Int.random(lower: 0, upper: count - 1)
        
        
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let controller = sb.instantiateViewController(withIdentifier: wordControllerId) as! showWordController
        controller.passWord = wordData[randIndex] as! String
        controller.passExpl = explData[randIndex] as! String
        controller.passRating = Int(ratingData[randIndex] as! String)
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
