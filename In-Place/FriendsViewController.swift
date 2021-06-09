//
//  FriendsViewController.swift
//  In-Place
//
//  Created by Иван Карамазов on 21.05.2021.
//

import UIKit

class FriendsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        friendsInterests.delegate = self
        friendsInterests.dataSource = self
      //friendsInterests.rowHeight = 300
      //friendsInterests.rowHeight = UITableView.automaticDimension
    }
    
    
@IBOutlet weak var friendsInterests: UITableView!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell: ViewRepresenation = tableView.dequeueReusableCell(withIdentifier: "ViewRepresentation", for: indexPath) as! ViewRepresenation
            //cell.placeName.text = "Liverpool"
            return cell
        default:
            let cell: StroriesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "Stories", for:indexPath) as! StroriesTableViewCell
              cell.storiesLabel.text = "Victory!"
              return cell
        }
    }
    
}
