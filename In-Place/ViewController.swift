//
//  ViewController.swift
//  In-Place
//
//  Created by Иван Карамазов on 18.05.2021.
//

import UIKit

class ViewController: UIViewController {

    let segueId = "openSettings"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func settingButton(_ sender: Any) {
        performSegue(withIdentifier: segueId, sender: nil)
    }
    
    
 
    
}
