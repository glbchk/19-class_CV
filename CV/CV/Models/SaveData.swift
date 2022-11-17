//
//  SaveData.swift
//  CV
//
//  Created by Glib Galchenko on 03.11.2022.
//

import Foundation
import UIKit

struct Experience: Codable {
	var startDate: String
	var endDate: String
	var companyName: String
	var positionName: String
}

struct Skills: Codable {
	var skillsName: String
	var rating: Int
}

struct UserImage: Codable{
	let imageData: Data?

	init(withImage image: UIImage?) {
		self.imageData = image?.pngData()
	}

	func getImage() -> UIImage? {
		guard let imageData = self.imageData else {
			return nil
		}
		let image = UIImage(data: imageData)

		return image
	}
}

struct UserInfo: Codable {
	var firstName: String?
	var lastName: String?
	var userImage: UserImage?
}
