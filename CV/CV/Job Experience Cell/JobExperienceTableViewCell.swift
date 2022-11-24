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

		
    }

	override func layoutSubviews() {
		super.layoutSubviews()

		self.contentView.translatesAutoresizingMaskIntoConstraints = true

		let margins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		contentView.frame = contentView.frame.inset(by: margins)
	}

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

	func addData(experience: Experience) {
		startDateExperienceLabel.text = experience.startDate
		endDateExperienceLabel.text = experience.endDate
		companyNameExperienceLabel.text = experience.companyName
		positionNameExperienceLabel.text = experience.positionName
	}
}
