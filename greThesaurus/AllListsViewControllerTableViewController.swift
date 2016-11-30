//
//  AllListsViewControllerTableViewController.swift
//  greThesaurus
//
//  Created by Ke Lu on 11/7/16.
//  Copyright © 2016 kelu2zhao102. All rights reserved.
//

import UIKit
var lists: [SpecificList] = []

class AllListsViewControllerTableViewController: UITableViewController {
    
    
    
    required init?(coder aDecoder: NSCoder) {
        // 1
        lists = [SpecificList]()
        
        // 2
        super.init(coder: aDecoder)
        
        // 3
        
        
        var list = SpecificList(name: "Level 1", rate: 1)
        lists.append(list)
        
        list = SpecificList(name: "Level 2", rate: 2)
        lists.append(list)
        
        list = SpecificList(name: "Level 3", rate: 3)
        lists.append(list)
        
        list = SpecificList(name: "Level 4", rate: 4)
        lists.append(list)
        
        list = SpecificList(name: "Level 5", rate: 5)
        lists.append(list)
        //saveSpecificLists()
        loadSpecificLists()
        
        /*
        for list in lists {
            let item = SpecificListItem()
            item.word = "Item for \(list.name)"
            list.items.append(item)
        }
        */
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 60.0
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

    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    */

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lists.count
    }

    func makeCell(for tableView: UITableView) -> UITableViewCell {
        let cellIdentifier = "Cell"
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) {
            return cell
        } else {
            return UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let cell = makeCell(for: tableView)
        let spList = lists[indexPath.row]
        cell.textLabel!.text = spList.name
        cell.accessoryType = .disclosureIndicator
        return cell
        // Configure the cell...

        // return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let spList = lists[indexPath.row]
        performSegue(withIdentifier: "ShowList", sender: spList)
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
        if segue.identifier == "ShowList" {
            let controller = segue.destination as! SpecificListViewController
            controller.spList = sender as! SpecificList
        }
    }
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("greThesaurus.plist")
    }

    func saveSpecificLists() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.encode(lists, forKey: "SpecificLists")
        archiver.finishEncoding()
        data.write(to: dataFilePath(), atomically: true)
    }

    func loadSpecificLists() {
        // 1
        let path = dataFilePath()
        // 2
        if let data = try? Data(contentsOf: path) {
            // 3
            let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
            lists = unarchiver.decodeObject(forKey: "SpecificLists") as! [SpecificList]
            unarchiver.finishDecoding()
        }
    }

    

}
