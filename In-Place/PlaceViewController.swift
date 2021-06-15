//
//  PlaceViewController.swift
//  In-Place
//
//  Created by Иван Карамазов on 10.06.2021.
//

import UIKit

class PlaceViewController: UIViewController {


    
    // MARK: Outlets
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var placeDescription: UILabel!
    
    
    var place: Places? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let p = place {
            mainImageView.image = UIImage(named: p.placeImage)
            placeDescription.text = p.placeDescription
            placeName.text = p.placeName
        }
    }


}
