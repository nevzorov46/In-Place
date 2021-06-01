//
//  HomeViewController.swift
//  In-Place
//
//  Created by Иван Карамазов on 25.05.2021.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var places: UITableView!
    
    let placesArray = [
        Places(placeImage: "Image", placeName: "San-Francisko", avatar1: "avatar 1", avatar2: "avatar 2", avatar3: "avatar 3", numberOfBooking: "+ 15 people booked", placeDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", city: "San-Francisko"),
        Places(placeImage: "Image", placeName: "San-Francisko", avatar1: "avatar 1", avatar2: "avatar 2", avatar3: "avatar 3", numberOfBooking: "+ 15 people booked", placeDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", city: "San-Francisko"),
        Places(placeImage: "Image", placeName: "San-Francisko", avatar1: "avatar 1", avatar2: "avatar 2", avatar3: "avatar 3", numberOfBooking: "+ 15 people booked", placeDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", city: "San-Francisko")
    ]
    
    let someDataFromNetwork = ["http", "protocol", "isConnect?"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        placesArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyTableViewCell
        
        let place = placesArray[indexPath.row]
        //cell.city.text = place.city
        cell.placeImage?.image = UIImage(named: place.placeImage)
        if indexPath.row == placesArray.count - 1 {
            cell.placeImage?.isHidden = true
        }
        
        else {
            cell.placeImage?.isHidden = false
        }

        return cell
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        places.delegate = self
        places.dataSource = self
        
        addGradient()

    }

    
    fileprivate func addGradient() {
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        layer.colors = [UIColor.yellow.cgColor, UIColor.orange.cgColor]
        layer.startPoint = CGPoint(x: 1.0, y: 1.0)
        layer.endPoint = CGPoint(x: 0.0, y: 0.0)
        view.layer.insertSublayer(layer, at: 0)
    }
    
}
