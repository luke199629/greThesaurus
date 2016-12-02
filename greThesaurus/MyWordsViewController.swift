//
//  MyWordsViewController.swift
//  greThesaurus
//
//  Created by Ke Lu on 11/2/16.
//  Copyright © 2016 kelu2zhao102. All rights reserved.
//

import UIKit
struct MyWordsContent {
    var name: String?
    var detail: String?
    var ratings: Int
    
    init(name: String?, detail: String?, ratings: Int) {
        self.name = name
        self.detail = detail
        self.ratings = ratings
    }
    
    
}

let MyWordsContentData = [
    MyWordsContent(name: "Level A", detail: "Rare", ratings: 1),
    MyWordsContent(name: "Level B", detail: "Medium-rare", ratings: 2),
    MyWordsContent(name: "Level C", detail: "Medium", ratings: 3),
    MyWordsContent(name: "Level D", detail: "Medium-well", ratings: 4),
    MyWordsContent(name: "Level E", detail: "Well Done", ratings: 5)]

class MyWordsViewController: UITableViewController {
    var myWordsData: [MyWordsContent] = MyWordsContentData
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
        return myWordsData.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell = tableView.dequeueReusableCell(withIdentifier: "ContentCell", for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContentCell", for: indexPath) as! ContentCell
        // Configure the cell...

        let content = myWordsData[indexPath.row] as MyWordsContent
        
        /*
        if let nameLabel = cell.viewWithTag(100) as? UILabel {
            nameLabel.text = content.name
        }
        if let detailLabel = cell.viewWithTag(101) as? UILabel {
            detailLabel.text = content.detail
        }
        if let ratingImageView = cell.viewWithTag(102) as? UIImageView {
            ratingImageView.image = self.ratingStars(ratings: content.ratings)
        }
        */
        
        cell.content = content
        return cell

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
