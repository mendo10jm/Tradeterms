//
//  CuentaViewController.swift
//  Tradeterms
//
//  Created by Jose Manuel Mendoza Marín on 14/05/2020.
//  Copyright © 2020 JoseManuelYPablo. All rights reserved.
//

import UIKit

class CuentaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: Actions
    // Boton que redirecciona a ajustes
    @IBAction func GoSettings(_ sender: Any) {
        if let url = NSURL(string: UIApplication.openSettingsURLString) as URL? {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    // Boton que redirecciona a ajustes
    @IBAction func GosettingsSec(_ sender: Any) {
        if let url = NSURL(string: UIApplication.openSettingsURLString) as URL? {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
