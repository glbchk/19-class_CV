//
//  JobExperienceTableViewCell.swift
//  CV
//
//  Created by Glib Galchenko on 02.11.2022.
//

import UIKit

class JobExperienceTableViewCell: UITableViewCell {

	@IBOutlet weak var startDateExperienceLabel: UILabel!
	@IBOutlet weak var endDateExperienceLabel: UILabel!
	@IBOutlet weak var companyNameExperienceLabel: UILabel!
	@IBOutlet weak var positionNameExperienceLabel: UILabel!

	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

	override func layoutSubviews() {
		super.layoutSubviews()

		let margins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
		contentView.frame = contentView.frame.inset(by: margins)
		contentView.layer.cornerRadius = 8
	}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

	func addData(experience: JobExp) {
		startDateExperienceLabel.text = experience.startDate
		endDateExperienceLabel.text = experience.endDate
		companyNameExperienceLabel.text = experience.companyName
		positionNameExperienceLabel.text = experience.positionName
	}
}
