//
//  ViewController.swift
//  CV
//
//  Created by Glib Galchenko on 31.10.2022.
//

import UIKit

class CvViewController: UIViewController, UINavigationControllerDelegate, UICollectionViewDelegate {

	@IBOutlet weak var cvImage: UIImageView!
	@IBOutlet weak var cvFirstNameLabel: UILabel!
	@IBOutlet weak var cvLastNameLabel: UILabel!
	@IBOutlet weak var addJobExpButton: UIButton!

	@IBOutlet weak var jobExperienceTableView: UITableView!
	@IBOutlet weak var skillsCollectionView: UICollectionView!

	let encoder = JSONEncoder()
	let decoder = JSONDecoder()

	var startDateTextField: UITextField!
	var endDateTextField: UITextField!
	var companyNameTextField: UITextField!
	var positionNameTextField: UITextField!

	var skillTextField: UITextField!
	var ratingSkillTextField: UITextField!
	var skillImage: UIImage!

	var allJobExp = [Experience]()
	var allSkills = [Skills]()

//	var didSaveButtonTapped: ((String) -> Void)?

	override func viewDidLoad() {
		super.viewDidLoad()

		jobExperienceTableView.delegate = self
		jobExperienceTableView.dataSource = self

		skillsCollectionView.delegate = self
		skillsCollectionView.dataSource = self

		jobExperienceTableView.register(
			UINib(nibName: "JobExperienceTableViewCell", bundle: nil),
			forCellReuseIdentifier: "JobExperienceTableViewCell"
			)

		skillsCollectionView.register(SkillsCollectionViewCell.self, forCellWithReuseIdentifier: "SkillsCustomCell")
		skillsCollectionView.register(UINib(nibName: "SkillsCollectionViewCell", bundle: nil),
									  forCellWithReuseIdentifier: "SkillsCustomCell")


	}

	private func getData() {
//		SetData.shared.data = [
//			JobExp(startDate: <#T##String#>, endDate: <#T##String#>, companyName: <#T##String#>, positionName: <#T##String#>
//		]
	}

	@IBAction func addPorfileData(_ sender: Any) {
	}

	@IBAction func addJobExperience(_ sender: Any) {

		let title = "Add your experience!"
		let message = "Here you can add the experience about your carrier."

		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

		if cvFirstNameLabel.text == "First name" || cvLastNameLabel.text == "Last name" {
			addJobExpButton.isEnabled = false

			let actionUnderstood = UIAlertAction(title: "Understood", style: .destructive) {_ in
				self.addJobExpButton.isEnabled = true
			}

			alert.addAction(actionUnderstood)

			present(alert, animated: true, completion: nil)

		} else {

			alert.addTextField { (textField) in
				self.startDateTextField = textField
				textField.placeholder = "The beginning year of experience"
			}

			alert.addTextField { (textField) in
				self.endDateTextField = textField
				textField.placeholder = "The finishing year of experience"
				//			SetData.shared.data.append(JobExp(endDate: textField.text))
			}

			alert.addTextField { (textField) in
				self.companyNameTextField = textField
				textField.placeholder = "Company name"
				//			SetData.shared.data.append(JobExp(companyName: textField.text))
			}

			alert.addTextField { (textField) in
				self.positionNameTextField = textField
				textField.placeholder = "Position name"
				//			SetData.shared.data.append(JobExp(positionName: textField.text))
			}

			let actionAdd = UIAlertAction(title: "Save experience", style: .default) { [self]
				(action: UIAlertAction!) -> Void in
				let savedData = Experience(startDate: startDateTextField.text ?? "", endDate: endDateTextField.text ?? "", companyName: companyNameTextField.text ?? "", positionName: positionNameTextField.text ?? "")
				allJobExp.append(savedData)

//				if let encoded = try? encoder.encode(self.allJobExp) {
//					let defaults = UserDefaults.standard
//					defaults.set(encoded, forKey: "jobExp")
//				}

//				if let savedProperty = UserDefaults.standard.object(forKey: "startDate") as? Data {
//					if let loadedProperty = try? decoder.decode([Experience].self, from: savedProperty) {
//						for property in loadedProperty {
//							print(property.startDate ?? "")
//						}
//					}
//					UserDefaults.standard.synchronize()
//				}

				jobExperienceTableView.reloadData()
			}

			let actionSaveAndAddMore = UIAlertAction(title: "Save and More experience", style: .default) { [self]
				(action: UIAlertAction!) -> Void in
				let savedData = Experience(startDate: startDateTextField.text ?? "", endDate: endDateTextField.text ?? "", companyName: companyNameTextField.text ?? "", positionName: positionNameTextField.text ?? "")
				allJobExp.append(savedData)

//				if let encoded = try? encoder.encode(self.allJobExp) {
//					let defaults = UserDefaults.standard
//					defaults.set(encoded, forKey: "jobExp")
//				}

				jobExperienceTableView.reloadData()
				self.present(alert, animated: true, completion: nil)
			}

			let actionCancel = UIAlertAction(title: "Cancel", style: .destructive)

			alert.addAction(actionAdd)
			alert.addAction(actionSaveAndAddMore)
			alert.addAction(actionCancel)

			present(alert, animated: true, completion: nil)
		}

	}

	@IBAction func addSkills(_ sender: Any) {

		let title = "Add your skill!"
		let message = "Here you can write one of your skills and set the rate of your skill from 1-3."

		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

//		if cvFirstNameLabel.text == "First name" || cvLastNameLabel.text == "Last name" {
//			addJobExpButton.isEnabled = false

//			let actionUnderstood = UIAlertAction(title: "Understood", style: .destructive) {_ in
//				self.addJobExpButton.isEnabled = true
//			}
//
//			alert.addAction(actionUnderstood)
//
//			present(alert, animated: true, completion: nil)
//
//		} else {

			alert.addTextField { (textField) in
				self.skillTextField = textField
				self.skillTextField.text = self.skillTextField.text?.lowercased()

				if let image = UIImage(named: self.skillTextField.text ?? "") {
					self.skillImage = image
				}
				textField.placeholder = "Write your skill"
			}
		


			alert.addTextField { (textField) in
				self.ratingSkillTextField = textField
				textField.placeholder = "Set your rate for askill"

				if textField.text != "1" || textField.text != "2" || textField.text != "3" {
					for action in alert.actions {
							action.isEnabled = false
					}

				} else {
					alert.actions.forEach { action in
						action.isEnabled = true
					}
				}
			}

			let actionAdd = UIAlertAction(title: "Save skill", style: .default) {
				(action: UIAlertAction!) -> Void in
				let savedData = Skills(skillsName: self.skillTextField.text ?? "", rating: Int(self.ratingSkillTextField.text!)!)
				self.allSkills.append(savedData)

				self.skillsCollectionView.reloadData()
			}
			let actionSaveAndAddMore = UIAlertAction(title: "Save and Add more skills", style: .default) {
				UIAlertAction in
				NSLog("OK Pressed")
			}
			let actionCancel = UIAlertAction(title: "Cancel", style: .destructive)

			alert.addAction(actionAdd)
			alert.addAction(actionSaveAndAddMore)
			alert.addAction(actionCancel)

			present(alert, animated: true, completion: nil)
//		}
	}

	@IBAction func resetCv(_ sender: Any) {
	}


}

extension CvViewController: UITableViewDelegate {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		CGSize(width: collectionView.frame.width / 2, height: collectionView.frame.height)
	}
}

extension CvViewController: UITableViewDataSource {

	func numberOfSections(in tableView: UITableView) -> Int {
		1
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return allJobExp.count
	}

//	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//		<#code#>
//	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let tableCell = tableView.dequeueReusableCell(
			withIdentifier: "JobExperienceTableViewCell",
			for: indexPath
		) as? JobExperienceTableViewCell else {
			return UITableViewCell()
		}

		let jobExp = allJobExp[indexPath.row]

		tableCell.addData(experience: jobExp)

		return tableCell
	}

//	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//	}

}

extension CvViewController: UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return allSkills.count
	}


	func numberOfSections(in collectionView: UICollectionView) -> Int {
		1
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let collectionCell = collectionView.dequeueReusableCell(
			withReuseIdentifier: "SkillsCustomCell",
			for: indexPath
		) as? SkillsCollectionViewCell else {
			return UICollectionViewListCell()
		}

		let skill = allSkills[indexPath.row]

		collectionCell.addData(skills: skill)

		return collectionCell
	}

}

extension CvViewController {

//	func setProperties() {
//		let encoder = JSONEncoder()
//		if let encoded = try? encoder.encode(self.allJobExp) {
//			let defaults = UserDefaults.standard
//			defaults.set(encoded, forKey: "jobExp")
//
//		}
//
//	}

//	func retrieveProperties() {
//		if let savedProperty = UserDefaults.standard.object(forKey: "startDate") as? Data {
//			let decoder = JSONDecoder()
//			if let loadedProperty = try? decoder.decode([Experience].self, from: savedProperty) {
//				for property in loadedProperty {
//					print(property.startDate ?? "")
//				}
//			}
//			UserDefaults.standard.synchronize()
//		}
//	}

//	func removeProperties() -> String {
//
////			UserDefaults.standard.removeObject(forKey: "startDate")
//
//	}

}

