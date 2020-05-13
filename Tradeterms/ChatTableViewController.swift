//
//  ChatTableViewController.swift
//  Tradeterms
//
//  Created by Jose Manuel Mendoza Marín on 13/05/2020.
//  Copyright © 2020 JoseManuelYPablo. All rights reserved.
//

import UIKit

class ChatTableViewController: UITableViewController {
    
    var chats = [Chat]()
    
    //MARK: Private Methods
    
    private func loadSampleChats() {
        let photo1 = UIImage(named: "10")
        let photo2 = UIImage(named: "7")
        let photo3 = UIImage(named: "14")
        
        guard let usu1 = Chat(name: "Juan",last: "¿Donde Quedamos?",photo: photo1) else {
            fatalError("Unable to instantiate usu1")
        }
        
        guard let usu2 = Chat(name: "Manuela",last: "10 euros",photo: photo2) else {
            fatalError("Unable to instantiate usu2")
        }
        
        guard let usu3 = Chat(name: "Paco",last: "Ok de acuerdo",photo: photo3) else {
            fatalError("Unable to instantiate usu3")
        }
        
        chats += [usu1, usu2, usu3]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleChats()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return chats.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "ChatTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ChatTableViewCell  else {
            fatalError("The dequeued cell is not an instance of ChatTableViewCell.")
        }
        
        // Fetches the appropriate articulo for the data source layout.
        let chat = chats[indexPath.row]
        
        cell.nameChatLavel.text = chat.name
        cell.photoChatUsu.image = chat.photo
        cell.lastMesageChatLabel.text = chat.last
        
        return cell
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
