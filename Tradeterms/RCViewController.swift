//
//  RCViewController.swift
//  Tradeterms
//
//  Created by user148597 on 5/5/20.
//  Copyright © 2020 JoseManuelYPablo. All rights reserved.
//

import UIKit

class RCViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func GoLoginEnviarEmail(_ sender: Any) {
        self.performSegue(withIdentifier: "EnviarEmailSegue", sender: self)
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
