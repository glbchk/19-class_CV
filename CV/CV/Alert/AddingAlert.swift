//
//  AddingAlert.swift
//  CV
//
//  Created by Glib Galchenko on 02.11.2022.
//

import Foundation
import UIKit

class Alert {
	static var shared = Alert()

	var didSaveButtonTapped: ((String) -> Void)?

	func showJobExpAlert(on vc:UIViewController, title:String, message:String) {

			let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

			alert.addTextField { (textField) in
				textField.placeholder = "The beginning year of experience"
				SetData.shared.data.append(JobExp(startDate: textField.text))
			}

			alert.addTextField { (textField) in
				textField.placeholder = "The finishing year of experience"
				SetData.shared.data.append(JobExp(endDate: textField.text))
			}

			alert.addTextField { (textField) in
				textField.placeholder = "Company name"
				SetData.shared.data.append(JobExp(companyName: textField.text))
			}

			alert.addTextField { (textField) in
				textField.placeholder = "Position name"
				SetData.shared.data.append(JobExp(positionName: textField.text))
			}

			let actionAdd = UIAlertAction(title: "Save experience", style: .default) {
				(action: UIAlertAction!) -> Void in

			}

		
			let actionSaveAndAddMore = UIAlertAction(title: "Save and More experience", style: .default) {
				UIAlertAction in
				NSLog("OK Pressed")
			}
			let actionCancel = UIAlertAction(title: "Cancel", style: .destructive)

			alert.addAction(actionAdd)
			alert.addAction(actionSaveAndAddMore)
			alert.addAction(actionCancel)

			vc.present(alert, animated: true, completion: nil)

		}

	func showSkillAlert(on vc:UIViewController, title:String, message:String) {

		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

		alert.addTextField { (textField) in

			textField.placeholder = "Write your skill"
		}

		let actionAdd = UIAlertAction(title: "Save skill", style: .default) {
			UIAlertAction in
			NSLog("OK Pressed")
		}
		let actionSaveAndAddMore = UIAlertAction(title: "Save and Add more skills", style: .default) {
			UIAlertAction in
			NSLog("OK Pressed")
		}
		let actionCancel = UIAlertAction(title: "Cancel", style: .destructive)

		alert.addAction(actionAdd)
		alert.addAction(actionSaveAndAddMore)
		alert.addAction(actionCancel)

		vc.present(alert, animated: true, completion: nil)
		}

	private init() {
		
	}
}
