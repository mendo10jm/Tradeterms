//
//  ChatTableViewCell.swift
//  Tradeterms
//
//  Created by Jose Manuel Mendoza Marín on 13/05/2020.
//  Copyright © 2020 JoseManuelYPablo. All rights reserved.
//

import UIKit
import os.log

class ChatTableViewCell: UITableViewCell {

    @IBOutlet weak var nameChatLavel: UILabel!
    @IBOutlet weak var photoChatUsu: UIImageView!
    @IBOutlet weak var lastMesageChatLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
