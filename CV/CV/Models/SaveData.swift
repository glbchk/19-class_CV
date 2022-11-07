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

struct Skills {
	var skillsName: String
}