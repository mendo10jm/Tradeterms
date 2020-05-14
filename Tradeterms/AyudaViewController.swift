//
//  AyudaViewController.swift
//  Tradeterms
//
//  Created by Jose Manuel Mendoza Marín on 14/05/2020.
//  Copyright © 2020 JoseManuelYPablo. All rights reserved.
//

import UIKit

class AyudaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //MARK: Actions

    //t¡redirecciona a la supuesta pagina web
    @IBAction func GoPreguntasFrecuentes(_ sender: Any) {
        if let url = URL(string: "http://Tradeterms-Preguntas.com") {
            UIApplication.shared.open(url, options: [:])
        }

    }
    @IBAction func GoContactanos(_ sender: Any) {
        if let url = URL(string: "http://Tradeterms-Contactanos.com") {
            UIApplication.shared.open(url, options: [:])
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
