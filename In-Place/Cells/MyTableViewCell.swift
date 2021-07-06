//
//  MyTableViewCell.swift
//  In-Place
//
//  Created by Иван Карамазов on 27.05.2021.
//

import UIKit

protocol MyTableViewCellDelegate: NSObject {
    func likeButtonClicked(cell: MyTableViewCell)
}

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var avatar1: UIImageView!
    @IBOutlet weak var avatar2: UIImageView!
    @IBOutlet weak var avatar3: UIImageView!
    @IBOutlet weak var numberOfBooking: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var placeDescription: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    weak var delegate: MyTableViewCellDelegate?
    
    @IBAction func likeButtonClicked(_ sender: Any) {
        if let delegate = delegate {
            delegate.likeButtonClicked(cell: self)
        }
    }
    
}
