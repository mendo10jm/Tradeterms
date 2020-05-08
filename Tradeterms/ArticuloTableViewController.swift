//
//  ArticuloTableViewController.swift
//  Tradeterms
//
//  Created by Jose Manuel Mendoza Marín on 08/05/2020.
//  Copyright © 2020 JoseManuelYPablo. All rights reserved.
//

import UIKit
import os.log

class ArticuloTableViewController: UITableViewController {

    //MARK: Properties
    
    var articulos = [Articulo]()
    //MARK: Actions
    @IBAction func unwindToArticuloList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ArtViewController, let articulo = sourceViewController.articulo {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing meal.
                articulos[selectedIndexPath.row] = articulo
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            else {
                // Add a new article.
                let newIndexPath = IndexPath(row: articulos.count, section: 0)
                
                articulos.append(articulo)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            
            // Save the article.
            saveArticulos()
            
        }
    }
    //MARK: Private Methods
    
    private func loadSampleArticulos() {
        let photo1 = UIImage(named: "vans")
        let photo2 = UIImage(named: "raton")
        let photo3 = UIImage(named: "bate")
        
        guard let articulo1 = Articulo(name: "Vans Old School",descriptionI: "Zapatillas bomba",zone: "Jaen", photo: photo1, rating: 4) else {
            fatalError("Unable to instantiate articulo1")
        }
        
        guard let articulo2 = Articulo(name: "Razer Raton",descriptionI: "Raton bomba",zone: "Jaen", photo: photo2, rating: 5) else {
            fatalError("Unable to instantiate articulo2")
        }
        
        guard let articulo3 = Articulo(name: "Bate",descriptionI: "Bate bomba",zone: "Jaen", photo: photo3, rating: 3) else {
            fatalError("Unable to instantiate articulo3")
        }
        
        articulos += [articulo1, articulo2, articulo3]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Use the edit button item provided by the table view controller.
        navigationItem.leftBarButtonItem = editButtonItem
        
        // Load any saved meals, otherwise load sample data.
        if let savedArticulos = loadArticulos() {
            articulos += savedArticulos
        }
        else {
            // Load the sample data.
            loadSampleArticulos()
        }
    }
    private func saveArticulos() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(articulos, toFile: Articulo.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Articulos successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save articulos...", log: OSLog.default, type: .error)
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articulos.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "ArticuloTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ArticuloTableViewCell  else {
            fatalError("The dequeued cell is not an instance of ArticuloTableViewCell.")
        }
        
        // Fetches the appropriate articulo for the data source layout.
        let articulo = articulos[indexPath.row]
        
        cell.nameLabel.text = articulo.name
        cell.photoImageView.image = articulo.photo
        cell.ratingControl.rating = articulo.rating
        
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
            articulos.remove(at: indexPath.row)
            saveArticulos()
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
        case "AddItem":
            os_log("Adding a new articulo.", log: OSLog.default, type: .debug)
        case "ShowDetail":
            guard let articuloDetailViewController = segue.destination as? ArtViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedArticuloCell = sender as? ArticuloTableViewCell else {
                fatalError("Unexpected sender: \(sender)")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedArticuloCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedArticulo = articulos[indexPath.row]
            articuloDetailViewController.articulo = selectedArticulo
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
            
        }
        
        
    }
    private func loadArticulos() -> [Articulo]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Articulo.ArchiveURL.path) as? [Articulo]
    }
    
    

}
