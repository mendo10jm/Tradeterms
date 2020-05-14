//
//  InvitarAmigosViewController.swift
//  Tradeterms
//
//  Created by Jose Manuel Mendoza Marín on 14/05/2020.
//  Copyright © 2020 JoseManuelYPablo. All rights reserved.
//

import UIKit

class PerfilViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
     //MARK: Actions
    
    //abre la seccion de aplicaciones disponibles para enviar un mensage, se selecciona y se envia.(invitar amigo)
    @IBAction func ShareLink(_ sender: Any) {
        //Set the default sharing message.
        let message = "Hola, te invito a que veas esta nueva aplicación que he descubierto"
        //Set the link to share.
        if let link = NSURL(string: "http://Tradeterms.com")
        {
            let objectsToShare = [message,link] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            activityVC.excludedActivityTypes = [UIActivity.ActivityType.airDrop, UIActivity.ActivityType.addToReadingList]
            self.present(activityVC, animated: true, completion: nil)
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
