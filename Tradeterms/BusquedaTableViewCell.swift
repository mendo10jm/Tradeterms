//
//  BusquedaTableViewCell.swift
//  Tradeterms
//
//  Created by Jose Manuel Mendoza Marín on 14/05/2020.
//  Copyright © 2020 JoseManuelYPablo. All rights reserved.
//

import UIKit
import os.log


protocol OptionButtonsDelegate1{

    func ConectTapped(at index:IndexPath)
}
class BusquedaTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    //Delegate Para abrir IMessage
    var delegate:OptionButtonsDelegate1!
   
    @IBOutlet weak var Contactbtn: UIButton!
    var indexPath:IndexPath!
    @IBAction func ContactAction(_ sender: UIButton) {
        self.delegate?.ConectTapped(at: indexPath)
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
