//
//  ViewController.swift
//  In-Place
//
//  Created by Иван Карамазов on 18.05.2021.
//

import UIKit

class ViewController: UIViewController {

    let vc = "settingsViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
  
    
    @IBAction func settingButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let settingsViewController = storyboard.instantiateViewController(identifier: vc) as! SettingsViewController
        navigationController?.pushViewController(settingsViewController, animated: true)
    }
 
    
}
