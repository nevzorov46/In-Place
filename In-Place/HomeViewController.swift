//
//  HomeViewController.swift
//  In-Place
//
//  Created by Иван Карамазов on 25.05.2021.
//

import UIKit
import SDWebImage

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MyTableViewCellDelegate {
    
  
    
    @IBOutlet weak var places: UITableView!
    var selectedPlace: Places?
    var placesArray: [Places] = [ /*
        Places(placeImage: "Places Post 1", placeName: "San-Francisko Bridge", avatar1: "avatar 1", avatar2: "avatar 2", avatar3: "avatar 3", numberOfBooking: "+ 15 people booked", placeDescription: "LabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabel", city: "San-Francisko"),
        Places(placeImage: "Places Post 2", placeName: "Zagreb Restaurant", avatar1: "avatar 1", avatar2: "avatar 2", avatar3: "avatar 3", numberOfBooking: "+ 3 people booked", placeDescription: "LabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabel", city: "Zagreb"),
        Places(placeImage: "Places Post 3", placeName: "London Bridge", avatar1: "avatar 1", avatar2: "avatar 2", avatar3: "avatar 3", numberOfBooking: "+ 30 people booked", placeDescription: "LabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabelLabel", city: "London")
            */
    ]
    
    /*
    let stringURL = "https://gist.githubusercontent.com/alex-zykov/1d649549408ad875250d2789ca72e937/raw/c3a8437e47f0d8ba365ef426a0fa7502cd873248/posts.json"
    
    
    // Если не указывается self , или [weak self]
    func getPlaces()  {
        guard let url = URL(string: stringURL) else { return }
        let task = URLSession.shared.dataTask(with: url, completionHandler: { [weak self]
            (data, response, error) in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            guard let data = data else { return }
            //print(String(decoding: data, as: UTF8.self))
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            guard let place = try? decoder.decode([Places].self, from: data) else {
                print("Error: can't parse Place")
                return
            }
            
            print(place[0].placeName)
            self?.placesArray = place
            
            DispatchQueue.main.async {
                self?.places.reloadData()
            }
        
        })
        
        task.resume()
    }

   */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        placesArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Places", for: indexPath) as! MyTableViewCell
        
        let place = placesArray[indexPath.row]
        cell.placeImage.sd_setImage(with: URL(string: place.placeImages[0]), completed: nil)
        cell.city.text = place.city
        cell.placeDescription.text = place.placeDescription
       // cell.numberOfBooking.text = place.numberOfBooking
        cell.numberOfBooking.text = String(place.bookings.numberOfBookings)
        cell.placeName.text = place.placeName
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let place = placesArray[indexPath.row]
        selectedPlace = place
        performSegue(withIdentifier: "segue01", sender: nil)
        
    }
    
    func likeButtonClicked(cell: MyTableViewCell) {
        if let indexPath = places.indexPath(for: cell) {
            let place = placesArray[indexPath.row]
            print(place.placeName)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segue01", let vc = segue.destination as? PlaceViewController, let place = selectedPlace{
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
        
        NetworkService.shared.getPlaces { placesOption in
            guard let places = placesOption else {
                print("Can not get Places")
                return
            }
            self.placesArray = places
           
                DispatchQueue.main.async {
                    self.places.reloadData()
                
            }
        }
 
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
