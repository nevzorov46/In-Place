//
//  HomeViewController.swift
//  In-Place
//
//  Created by Иван Карамазов on 25.05.2021.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var places: UITableView!
    
    
    var selectedPlace: Places? = nil
    
    let placesArray = [
        Places(placeImage: "Places Post 1", placeName: "San-Francisko Bridge", avatar1: "avatar 1", avatar2: "avatar 2", avatar3: "avatar 3", numberOfBooking: "+ 15 people booked", placeDescription: "LabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabel", city: "San-Francisko"),
        Places(placeImage: "Places Post 2", placeName: "Zagreb Restaurant", avatar1: "avatar 1", avatar2: "avatar 2", avatar3: "avatar 3", numberOfBooking: "+ 3 people booked", placeDescription: "LabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabel", city: "Zagreb"),
        Places(placeImage: "Places Post 3", placeName: "London Bridge", avatar1: "avatar 1", avatar2: "avatar 2", avatar3: "avatar 3", numberOfBooking: "+ 30 people booked", placeDescription: "LabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabel", city: "London")
    ]
    
    //let someDataFromNetwork = ["http", "protocol", "isConnect?"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        placesArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Places", for: indexPath) as! MyTableViewCell
        
        let place = placesArray[indexPath.row]
        //cell.city.text = place.city
        cell.placeImage.image = UIImage(named: place.placeImage)
        cell.city.text = place.city
        cell.placeDescription.text = place.placeDescription
        cell.numberOfBooking.text = place.numberOfBooking
        cell.placeName.text = place.placeName
        
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let place = placesArray[indexPath.row]
        selectedPlace = place
        performSegue(withIdentifier: "segue01", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue01",
           let vc = segue.destination as? PlaceViewController,
           let place = selectedPlace{
            vc.place = place

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        places.delegate = self
        places.dataSource = self
        places.estimatedRowHeight = 400
        places.rowHeight = UITableView.automaticDimension
        
        addGradient()

    }

    
    fileprivate func addGradient() {
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        layer.colors = [UIColor.orange.cgColor, UIColor.purple.cgColor]
        layer.startPoint = CGPoint(x: 1.0, y: 0.0)
        layer.endPoint = CGPoint(x: 1.0, y: 1.0)
        view.layer.insertSublayer(layer, at: 0)
    }
    
}
