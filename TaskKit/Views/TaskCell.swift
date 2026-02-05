//
//  TaskCell.swift
//  TaskKit
//
//  Created by Harsh Singh on 04/02/26.
//

import UIKit

class TaskCell: UITableViewCell {
    @IBOutlet weak var stackContainer: UIView!
    
    @IBOutlet weak var switchView: UISwitch!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
