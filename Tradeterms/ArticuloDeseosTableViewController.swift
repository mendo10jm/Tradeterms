//
//  ArticuloDeseosTableViewController.swift
//  Tradeterms
//
//  Created by user148597 on 8/5/20.
//  Copyright © 2020 JoseManuelYPablo. All rights reserved.
//

import UIKit
import os.log

class ArticuloDeseosTableViewController: UITableViewController {

    //MARK: Properties
    var articulosDeseos = [ArticuloDeseo]()
    
    //MARK: Actions
    @IBAction func unwindToArticuloDeseosList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ArtDeseosViewController, let articuloDeseos = sourceViewController.articuloDeseos {
            if let selectedIndexPathDeseos = tableView.indexPathForSelectedRow {
                //Update an existing meal
                articulosDeseos[selectedIndexPathDeseos.row] = articuloDeseos
                tableView.reloadRows(at: [selectedIndexPathDeseos], with: .none)
            } else {
            //Add a new item
            let newIndexPath = IndexPath(row: articulosDeseos.count, section: 0)
            articulosDeseos.append(articuloDeseos)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            //Save the articulosdeseos
            saveArticuloDeseos()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Use the edit button item provided by the table view controller
        navigationItem.leftBarButtonItem = editButtonItem

        //Load any saved meals, otherwise load sample data.
        if let savedArticulosDeseos = loadArticulosDeseos() {
            articulosDeseos += savedArticulosDeseos
        } else {
            //Load sample data
            loadSampleArtDeseos()
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return articulosDeseos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Table view cells are reused and should be dequed using a cell identifier
        let cellIdentifier = "ArticuloDeseosTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ArticuloDeseosTableViewCell else {
            fatalError("The dequeued cell is not an instance of ArticuloDeseosTableViewCell")
        }
        
        //Fetches the appropiate article for the data source layout
        let articuloDeseos = articulosDeseos[indexPath.row]

        cell.nameLabel.text = articuloDeseos.name
        cell.photoImageView.image = articuloDeseos.photo
        cell.ratingControl.rating = articuloDeseos.rating

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            articulosDeseos.remove(at: indexPath.row)
            saveArticuloDeseos()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
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
        super.prepare(for: segue, sender: sender)
        switch(segue.identifier ?? "") {
        case "AddItemDeseos":
            os_log("Adding a new item to deseos.", log: OSLog.default, type: .debug)
        
        case "ShowDetailDeseos":
            guard let articuloDeseosDetailViewController = segue.destination as? ArtDeseosViewController
                else {
                    fatalError("Unexpected destination: \(segue.destination)")
            }
            guard let selectedArticuloDeseosCell = sender as? ArticuloDeseosTableViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            guard let indexPathDeseos = tableView.indexPath(for: selectedArticuloDeseosCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            let selectedArticuloDeseos = articulosDeseos[indexPathDeseos.row]
            articuloDeseosDetailViewController.articuloDeseos = selectedArticuloDeseos
        
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }
 
    //MARK: Private Mathods
    private func loadSampleArtDeseos(){
       
    }
    
    private func saveArticuloDeseos() {
        let isSuccesfulSaveDeseos = NSKeyedArchiver.archiveRootObject(articulosDeseos, toFile: ArticuloDeseo.ArchiveURL.path)
        if isSuccesfulSaveDeseos {
            os_log("Articulo deseos succesfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save meals...", log: OSLog.default, type: .error)
        }
    }
    
    private func loadArticulosDeseos() -> [ArticuloDeseo]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: ArticuloDeseo.ArchiveURL.path) as? [ArticuloDeseo]
    }
}
