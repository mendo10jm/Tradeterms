//
//  RViewController.swift
//  Tradeterms
//
//  Created by Jose Manuel Mendoza Marín on 28/04/2020.
//  Copyright © 2020 JoseManuelYPablo. All rights reserved.
//

import UIKit

class RViewController: UIViewController {
    //MARK: Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: Actions
    
    @IBAction func GoPPrincipalCrearCuenta(_ sender: Any) {
        performSegue(withIdentifier: "PPrincipalRegistroSegue", sender: self)
    }
}
