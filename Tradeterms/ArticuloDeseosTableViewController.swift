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
    var articulosDeseos = [Articulo]()
    
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
        
        //Loading sample data
        loadSampleArtDeseos()
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
                fatalError("Unexpected sender: \(sender)")
            }
            guard let indexPathDeseos = tableView.indexPath(for: selectedArticuloDeseosCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            let selectedArticuloDeseos = articulosDeseos[indexPathDeseos.row]
            articuloDeseosDetailViewController.articuloDeseos = selectedArticuloDeseos
        
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
    }
 
    //MARK: Private Mathods
    private func loadSampleArtDeseos(){
        let fotoDeseos1 = UIImage(named: "gameboy")
        let fotoDeseos2 = UIImage(named: "zapas")
        let fotoDeseos3 = UIImage(named: "reloj")
        
        guard let artDeseos1 = Articulo(name: "Game Boy Advance", descriptionI: "GB Advance de 2002 casi nueva a poder ser y en color azul" , zone: "Jaen", photo: fotoDeseos1, rating: 4) else {
            fatalError("No se pudo cargar el item 1")
        }
        guard let artDeseos2 = Articulo(name: "Nike Hypervenom", descriptionI: "Zapatillas nike de 2013, con tacos" , zone: "Jaen", photo: fotoDeseos2, rating: 5) else {
            fatalError("No se pudo cargar el item 1")
        }
        guard let artDeseos3 = Articulo(name: "Apple Watch Series 3", descriptionI: "iWatch Series 3, no importa el uso, color negro" , zone: "Jaen", photo: fotoDeseos3, rating: 2) else {
            fatalError("No se pudo cargar el item 3")
        }
        articulosDeseos += [artDeseos1, artDeseos2, artDeseos3]
    }
    
    private func saveArticuloDeseos() {
        let isSuccesfulSaveDeseos = NSKeyedArchiver.archiveRootObject(articulosDeseos, toFile: Articulo.ArchiveURL.path)
        if isSuccesfulSaveDeseos {
            os_log("Articulo deseos succesfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save meals...", log: OSLog.default, type: .error)
        }
    }
    
    private func loadArticulosDeseos() -> [Articulo]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Articulo.ArchiveURL.path) as? [Articulo]
    }
}
