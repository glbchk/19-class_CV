//
//  SkillsCollectionViewCell.swift
//  CV
//
//  Created by Glib Galchenko on 02.11.2022.
//

import UIKit

class SkillsCollectionViewCell: UICollectionViewCell {

	@IBOutlet weak var skillsImage: UIImageView!
	@IBOutlet weak var skillsNameLabel: UILabel!

	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

	override func layoutSubviews() {
		super.layoutSubviews()

		let margins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
		contentView.frame = contentView.frame.inset(by: margins)
	}

	func addData(skills: Skills) {
		skillsNameLabel.text = skills.skillsName
	}
}
