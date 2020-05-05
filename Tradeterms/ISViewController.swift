//
//  ISViewController.swift
//  Tradeterms
//
//  Created by Jose Manuel Mendoza Marín on 28/04/2020.
//  Copyright © 2020 JoseManuelYPablo. All rights reserved.
//

import UIKit

class ISViewController: UIViewController {
    //MARK: Properties
    
    @IBAction func GoRCViewController(_ sender: Any) {
        self.performSegue(withIdentifier: "GoRCSegue", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: Actions
    
}
