//
//  SpecificListViewController.swift
//  greThesaurus
//
//  Created by Ke Lu on 11/8/16.
//  Copyright © 2016 kelu2zhao102. All rights reserved.
//

import UIKit

class SpecificListViewController: UITableViewController, AddWordViewControllerDelegate {
    var spList: SpecificList!
    // var items: [SpecificListItem]
    
    /*
    required init?(coder aDecoder: NSCoder) {
        // items = [SpecificListItem]()

        /*
        let row0item = SpecificListItem()
        row0item.word = "abandon"
        row0item.expl = "being thrown away"
        items.append(row0item)
        
        let row1item = SpecificListItem()
        row1item.word = "abate"
        row1item.expl = "to put an end to"
        items.append(row1item)
        */
        
        super.init(coder: aDecoder)
        loadSpecificListItems()
        // print("Documents folder is \(documentsDirectory())")
        // print("Data file path is \(dataFilePath())")
    }
     */
    
    /*
    @IBAction func addItem() {
        let newRowIndex = items.count
        let item = SpecificListItem()
        item.word = "I am a new row"
        item.expl = "lalala"
        items.append(item)
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        
        
    }
     */
    
    /*
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    */
 
    /*
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("greThesaurus.plist")
    }
    */
 
    override func viewDidLoad() {
        super.viewDidLoad()
        title = spList.name

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
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        // return 0
        return spList.items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificListItem", for: indexPath)
        
        let item = spList.items[indexPath.row]
        // let label = cell.viewWithTag(1000) as! UILabel
        // label.text = item.word
        configureWord(for: cell, with: item)
        
        // Configure the cell...

        return cell
    }
    
    func configureWord(for cell: UITableViewCell, with item: SpecificListItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.word
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        /*
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }  
         */
        // 1
        spList.items.remove(at: indexPath.row)
        
        // 2
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        
        //saveSpecificListItems()
    }
    
    func addWordViewControllerdidCancel(_ controller: AddWordViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func addWordViewController(_ controller: AddWordViewController, didFinishAdding item: SpecificListItem) {
        let newRowIndex = spList.items.count
        spList.items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        dismiss(animated: true, completion: nil)
        
        //saveSpecificListItems()
    }
    

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
        // 1
        if segue.identifier == "AddWord" {
            // 2
            let navigationController = segue.destination as! UINavigationController
            // 3
            let controller = navigationController.topViewController as! AddWordViewController
            // 4
            controller.delegate = self
        }
    }
    
    /*
    func saveSpecificListItems() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.encode(spList.items, forKey: "SpecificListItems")
        archiver.finishEncoding()
        data.write(to: dataFilePath(), atomically: true)
    }
    */
    
    /*
    func loadSpecificListItems() {
        // 1
        let path = dataFilePath()
        // 2
        if let data = try? Data(contentsOf: path) {
            // 3
            let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
            spList.items = unarchiver.decodeObject(forKey: "SpecificListItems") as! [SpecificListItem]
            unarchiver.finishDecoding()
        }
    }
    */
    

}
