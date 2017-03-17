//
//  InventoryTableViewController.swift
//  Tamagotchi
//
//  Created by Jonathan Salin Lee on 3/16/17.
//  Copyright © 2017 Jonathan Salin Lee. All rights reserved.
//

import UIKit
import CoreData

class InventoryTableViewController: UITableViewController {
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var inventoryList:Inventory?
    var foodCounts = [Int]()

    // Unused code blocks
    
    //                foodCounts = [playerInv.redBerriesCount,playerInv.blueBerriesCount,playerInv.greenBerriesCount,playerInv.yellowBerriesCount]
    // [0,0,0,0]
    // Unused code blocks
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchAllItems()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        // Configure the cell...
//        switch(indexPath.section) {
//        case 1:
//            switch(indexPath.row) {
//            case 0:
//                cell.textLabel?.text = "Red berries:"
//                cell.detailTextLabel?.text = "\(inventoryList?.redBerriesCount)"
//            case 1:
//                cell.textLabel?.text = "Green berries:"
//                cell.detailTextLabel?.text = "\(inventoryList?.greenBerriesCount)"
//            case 2:
//                cell.textLabel?.text = "Blue berries:"
//                cell.detailTextLabel?.text = "\(inventoryList?.blueBerriesCount)"
//            case 3:
//                cell.textLabel?.text = "Yellow berries:"
//                cell.detailTextLabel?.text = "\(inventoryList?.yellowBerriesCount)"
//            default:
//                break;
//            }
//        default:
//            break;
//        }
        return cell
    }
    func fetchAllItems() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Inventory")
        do {
            // If inventory does not exist, initialize empty inventory
            let result = try managedObjectContext.fetch(request)
            let item = result as! [Inventory]
            if item.count == 0 {
                let playerInv = Inventory(context: managedObjectContext)
                playerInv.redBerriesCount = 0
                playerInv.blueBerriesCount = 0
                playerInv.greenBerriesCount = 0
                playerInv.yellowBerriesCount = 0
                do {
                    try managedObjectContext.save()
                } catch { print("Error") }
            }
            // Assign the inventory instance to self
            self.inventoryList = item[0]
        } catch {
            print("Error")
        }
        
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
