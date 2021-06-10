//
//  PlaceViewController.swift
//  In-Place
//
//  Created by Иван Карамазов on 10.06.2021.
//

import UIKit

class PlaceViewController: UIViewController {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var placeText: UILabel!
    
    var place: Places? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let p = place {
            mainImageView.image = UIImage(named: p.placeImage)
            placeText.text = p.placeDescription
        }

    }


}
