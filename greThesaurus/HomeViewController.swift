//
//  HomeViewController.swift
//  greThesaurus
//
//  Created by Ke Lu on 11/2/16.
//  Copyright © 2016 kelu2zhao102. All rights reserved.
//

import UIKit

struct HomeContent {
    var name: String?
    var detail: String?
    
    init(name: String?, detail: String?) {
        self.name = name
        self.detail = detail
    }
}



class HomeViewController: UITableViewController {
    
    var wordData = NSArray()
    var explData = NSArray()
    var ratingData = NSArray()
    
    var passWord = ""
    var passExpl = ""
    var passRating = 0

    
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
        print("\(wordData[0])\(explData[0])\(ratingData[0])")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        // return 0
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // return 0
        return wordData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContentCell", for: indexPath)

        // Configure the cell...
        let idx = indexPath.row
//        print(idx)
        let content = wordData[idx] as! String
        cell.textLabel?.text = content
//        passWord = wordData[idx] as! String
//        passExpl = explData[idx] as! String
//        passRating = Int(ratingData[idx] as! String)!

        
//        passRating = 0

        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        passWord = wordData[indexPath.row] as! String
        passExpl = explData[indexPath.row] as! String
        passRating = Int(ratingData[indexPath.row] as! String)!

        self.performSegue(withIdentifier: "showMyWords", sender: self)
//        self.performSegue(withIdentifier: "showMyWords", sender: passExpl)
//        self.performSegue(withIdentifier: "showMyWords", sender: passRating)
        
//        let svc = showWordController
//        svc.passWord = passWord
//        svc.passExpl = passExpl
//        svc.passRating = passRating
        
        
    }
    
    
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showMyWords" {
            let svc = segue.destination as! showWordController
            svc.passWord = passWord
            svc.passExpl = passExpl
            svc.passRating = passRating
        }
    }
    

}
