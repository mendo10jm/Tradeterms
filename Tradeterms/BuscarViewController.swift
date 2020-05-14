//
//  BuscarViewController.swift
//  Tradeterms
//
//  Created by Jose Manuel Mendoza Marín on 14/05/2020.
//  Copyright © 2020 JoseManuelYPablo. All rights reserved.
//

import UIKit
import os.log

class BuscarViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating,OptionButtonsDelegate1{
    
    @IBOutlet weak var tableView: UITableView!
    
    var searchController : UISearchController!
    
    var resultsController = UITableViewController()
    
    //MARK: Properties
    var articulosDeseos = [ArticuloDeseo]()//array con todos los articulos
    
    var filteredarticulo = [ArticuloDeseo]()//array con los articulos filtrados
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let savedArticulosDeseos = loadArticulosDeseos() {
            articulosDeseos += savedArticulosDeseos
        }
        
        self.creatingSearhBar()
        self.tableSettings()
        

        // Do any additional setup after loading the view.
    }
    //MARK: Action
    
    @IBAction func GoContact(_ sender: Any) {
    }
    // MARK: - Table view data source
    
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        //    si la TableView que realiza la llamada a este método es nuestra tabla principal, devolvemos el número de elementos de nuestro array
        // En cambio, si la TableView que llama a este método es la tabla de resultados, devolvemos el número de elementos de nuestro array filteredExercises (Que contiene únicamente los articulos que coincidan con la búsqueda)
        if tableView == self.tableView {
            return articulosDeseos.count
        }
        else {
            return filteredarticulo.count
        }
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Table view cells are reused and should be dequed using a cell identifier
        let cellIdentifier = "BusquedaTableViewCell"
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! BusquedaTableViewCell
        
        //    si la TableView que realiza la llamada a este método es nuestra tabla principal, devolvemos el número de elementos de nuestro array
        // En cambio, si la TableView que llama a este método es la tabla de resultados, devolvemos el número de elementos de nuestro array filteredExercises (Que contiene únicamente los articulos que coincidan con la búsqueda)
         if tableView == self.tableView {
            //Fetches the appropiate article for the data source layout
            let articuloDeseos = articulosDeseos[indexPath.row]
            
            cell.nameLabel.text = articuloDeseos.name
            cell.photoImageView.image = articuloDeseos.photo
            cell.ratingControl.rating = articuloDeseos.rating
            
         }else{
            
            let articuloDeseos = filteredarticulo[indexPath.row]
            
            cell.nameLabel.text = articuloDeseos.name
            cell.photoImageView.image = articuloDeseos.photo
            cell.ratingControl.rating = articuloDeseos.rating
        }
        
        //Delegate para abrir IMessage
        cell.delegate = self
        cell.indexPath = indexPath
        
        return cell
    }
    
    private func loadArticulosDeseos() -> [ArticuloDeseo]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: ArticuloDeseo.ArchiveURL.path) as? [ArticuloDeseo]
    }
    
//    funciones buscador
    func creatingSearhBar() {
        //1
        self.searchController = UISearchController(searchResultsController: self.resultsController)
        //2
        self.tableView.tableHeaderView = self.searchController.searchBar
        //3
        self.searchController.searchResultsUpdater = self
    }
    
    func tableSettings() {
        self.resultsController.tableView.dataSource = self
        self.resultsController.tableView.delegate = self
        self.resultsController.tableView.rowHeight = 100
        self.resultsController.tableView.separatorStyle = .none
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        //filtramso por nobre de articulo
        self.filteredarticulo = self.articulosDeseos.filter { (art: ArticuloDeseo) -> Bool in
            if art.name.lowercased().contains(self.searchController.searchBar.text!.lowercased()){
                return true
            } else{
                return false
            }
        }
        
        self.resultsController.tableView.reloadData()
    }
    
    func ConectTapped(at index: IndexPath) {
        let sms: String = "sms:+689356788&body=Hola, Me interesa tu articulo"
        let strURL: String = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        UIApplication.shared.open(URL.init(string: strURL)!, options: [:], completionHandler: nil)
    }

}
