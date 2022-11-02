//
//  JobExperienceTableViewCell.swift
//  CV
//
//  Created by Glib Galchenko on 02.11.2022.
//

import UIKit

class JobExperienceTableViewCell: UITableViewCell {

	@IBOutlet weak var dateExperienceLabel: UILabel!
	@IBOutlet weak var companyNameExperienceLabel: UILabel!
	@IBOutlet weak var positionNameExperienceLabel: UILabel!

	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
