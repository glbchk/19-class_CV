//
//  SkillsCollectionViewCell.swift
//  CV
//
//  Created by Glib Galchenko on 02.11.2022.
//

import UIKit

class SkillsCollectionViewCell: UICollectionViewCell {

	@IBOutlet var ratingImages: [UIImageView]!

	@IBOutlet weak var skillsImage: UIImageView!
	@IBOutlet weak var skillsNameLabel: UILabel!

	override func awakeFromNib() {
        super.awakeFromNib()

    }

	func addData(skills: Skills) {
		skillsNameLabel.text = skills.skillsName
		skillsImage.image = UIImage(named: skills.skillsName)

		switch skills.rating {
		case 1:
			ratingImages[0].image = UIImage(systemName: "star.fill")
			ratingImages[1].image = UIImage(systemName: "star")
			ratingImages[2].image = UIImage(systemName: "star")
		case 2:
			ratingImages[0].image = UIImage(systemName: "star.fill")
			ratingImages[1].image = UIImage(systemName: "star.fill")
			ratingImages[2].image = UIImage(systemName: "star")
		case 3:
			ratingImages[0].image = UIImage(systemName: "star.fill")
			ratingImages[1].image = UIImage(systemName: "star.fill")
			ratingImages[2].image = UIImage(systemName: "star.fill")
		default: break
		}
	}
}
