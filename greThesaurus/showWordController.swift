//
//  showWordController.swift
//  greThesaurus
//
//  Created by Ke Lu on 11/15/16.
//  Copyright © 2016 kelu2zhao102. All rights reserved.
//

import UIKit

class showWordController: UIViewController {

    var passWord: String!
    var passExpl: String!
    var passRating: Int!
    
    @IBOutlet weak var word: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var expl: UILabel!

    @IBAction func operate(_ sender: UIButton) {
        let operation: Int! = Int(sender.currentTitle!)
        print(operation)
        let idx = wordData.index(of: passWord)
        print(idx)
        ratingData[idx] = String(operation)
//        let path2:String! = Bundle.main.path(forResource: "ratings", ofType: "plist")
//        ratingData.write(toFile: path2, atomically: true)
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let dataFilePath = paths[0].appendingPathComponent("ratingFile.plist")
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.encode(ratingData, forKey: "ratingFile")
        archiver.finishEncoding()
        data.write(to: dataFilePath, atomically: true)
        
        rating.text = String(operation)
        
        for i in 0 ..< 5 {
            let tmp = lists[i].items.filter {$0.word != passWord}
            lists[i].items = tmp
        }
        
        let item = SpecificListItem()
        item.word = passWord
        item.expl = passExpl
        item.rating = operation
        lists[operation-1].items.append(item)
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("\(passWord), \(passExpl),\(passRating)")
        // Do any additional setup after loading the view.
        word.text = passWord
        expl.text = passExpl
        rating.text = String(passRating)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
