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
        Places(placeImage: "Image", placeName: "San-Francisko", avatar1: "avatar 1", avatar2: "avatar 2", avatar3: "avatar 3", numberOfBooking: "+ 15 people booked", placeDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", city: "San-Francisko")
    ]
    
    let someDataFromNetwork = ["http", "protocol", "isConnect?"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MyTableViewCell
        
        let place = placesArray[indexPath.row]
        //cell.city.text = place.city
        cell.imageView?.image = UIImage(named: place.placeImage)

        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        places.delegate = self
        places.dataSource = self

    }

    
    
    
}
