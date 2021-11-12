//
//  SomeViewController.swift
//  In-Place
//
//  Created by Иван Карамазов on 03.10.2021.
//


import UIKit


protocol Test {
    func testMethod()
}


struct OutputData {
    var placeName: String
    var description: String
    var imageAvatars: [UIImageView]
    var mainImage: UIImageView
    var numberOfLikes: Int
}



// API - Application Programming Interface
// JSON
class SomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var places: UITableView!
    let albums = ["Альбом 1", "Альбом 2",  "Альбом 3"]
    
    /*
    var places: [Places] = [

    ]
    */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Возвращает количество ячеек в таблице
        return 1_000_000
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        // история с подставлениями
        let cell: MyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "place", for: indexPath) as! MyTableViewCell
     
        
        
       
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // мы передаем управление View Controller над places
        places.delegate = self
        // данные которыми будет заполнятся places они будут запрашиваться
        // вью контроллером
        places.dataSource = self
        
        
        // Мы регистрируем ячейку но не показываем
        places.register(UITableViewCell.self, forCellReuseIdentifier: "place")
        
        
        
    }
}
