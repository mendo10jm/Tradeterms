//
//  ChatTableViewCell.swift
//  Tradeterms
//
//  Created by Jose Manuel Mendoza Marín on 13/05/2020.
//  Copyright © 2020 JoseManuelYPablo. All rights reserved.
//

import UIKit
import os.log

protocol OptionButtonsDelegate{
    func VerTapped(at index:IndexPath)
}
class ChatTableViewCell: UITableViewCell {

    @IBOutlet weak var nameChatLavel: UILabel!
    @IBOutlet weak var photoChatUsu: UIImageView!
    @IBOutlet weak var lastMesageChatLabel: UILabel!
    
    //Delegate Para abrir IMessage
    var delegate:OptionButtonsDelegate!
    @IBOutlet weak var Ver: UIButton!
    var indexPath:IndexPath!
    @IBAction func VerAction(_ sender: Any) {
        self.delegate?.VerTapped(at: indexPath)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
