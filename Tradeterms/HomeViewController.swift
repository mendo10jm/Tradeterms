//
//  ViewController.swift
//  CustomUIButton
//
//  Created by Sean Allen on 2/2/19.
//  Copyright © 2019 Sean Allen. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    //MARK: Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: Actions
    @IBAction func GoRegistro(_ sender: Any) {
         self.performSegue(withIdentifier: "RegistroSegue", sender: self)
        
    }
    
    
    @IBAction func GoInicioSesion(_ sender: Any) {
        
        self.performSegue(withIdentifier: "IniciarSesionSegue", sender: self)
    }
}


