//
//  StroriesTableViewCell.swift
//  In-Place
//
//  Created by Иван Карамазов on 07.06.2021.
//

import UIKit

class StroriesTableViewCell: UITableViewCell {

    @IBOutlet weak var storiesLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
