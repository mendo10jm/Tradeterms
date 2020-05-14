//
//  ChatTableViewController.swift
//  Tradeterms
//
//  Created by Jose Manuel Mendoza Marín on 13/05/2020.
//  Copyright © 2020 JoseManuelYPablo. All rights reserved.
//

import UIKit

class ChatTableViewController: UITableViewController, OptionButtonsDelegate {
    
//    función que abre IMesage y enviaria ese mensage, pero en el simulador simplemente abre IMessage
    func VerTapped(at index: IndexPath) {
        let sms: String = "sms:+689356788&body=Hola, Me interesa tu articulo"
        let strURL: String = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        UIApplication.shared.open(URL.init(string: strURL)!, options: [:], completionHandler: nil)
    }
    
    
    var chats = [Chat]()
    
    //MARK: Private Methods
    
    private func loadSampleChats() {
        let photo1 = UIImage(named: "10")
        let photo2 = UIImage(named: "7")
        let photo3 = UIImage(named: "14")
        
        guard let usu1 = Chat(name: "Juan",last: "¿Donde Quedamos?",photo: photo1) else {
            fatalError("Unable to instantiate usu1")
        }
        
        guard let usu2 = Chat(name: "Manuela",last: "¿Donde Quedamos?",photo: photo2) else {
            fatalError("Unable to instantiate usu2")
        }
        
        guard let usu3 = Chat(name: "Paco",last: "Ok de acuerdo",photo: photo3) else {
            fatalError("Unable to instantiate usu3")
        }
        
        chats += [usu2,usu1, usu3]
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
        
        //Delegate para abrir IMessage
        cell.delegate = self
        cell.indexPath = indexPath
        
        return cell
    }



}
