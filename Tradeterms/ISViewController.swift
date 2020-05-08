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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: Actions
    @IBAction func GoRecuperarContrasena(_ sender: Any) {
        self.performSegue(withIdentifier: "RecuperarContrasenaSegue", sender: self)

    }

    @IBAction func GoPPrincipal(_ sender: Any) {
        performSegue(withIdentifier: "PPrincipalLoginSegue", sender: self)
    }
}
