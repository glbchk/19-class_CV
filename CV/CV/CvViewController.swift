//
//  ViewController.swift
//  CV
//
//  Created by Glib Galchenko on 31.10.2022.
//

import UIKit

class CvViewController: UIViewController {

	@IBOutlet weak var cvImage: UIImageView!
	@IBOutlet weak var cvFirstNameLabel: UILabel!
	@IBOutlet weak var cvLastNameLabel: UILabel!

	@IBOutlet weak var jobExperienceTableView: UITableView!
	@IBOutlet weak var skillsCollectionView: UICollectionView!

//	var didSaveButtonTapped: ((String) -> Void)?

	override func viewDidLoad() {
		super.viewDidLoad()

		jobExperienceTableView.delegate = self
		jobExperienceTableView.dataSource = self

		jobExperienceTableView.register(
			UINib(nibName: "JobExperienceTableViewCell", bundle: nil),
			forCellReuseIdentifier: "JobExperienceTableViewCell"
		)
	}

	private func getData() {
		SetData.shared.data = [
			JobExp(startDate: <#T##String#>, endDate: <#T##String#>, companyName: <#T##String#>, positionName: <#T##String#>
		]
	}

	@IBAction func addPorfileData(_ sender: Any) {
	}

	@IBAction func addJobExperience(_ sender: Any) {

		let title = "Add your experience!"
		let message = "Here you can add the experience about your carrier."

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
			if alert.textFields?.first?.text?.isEmpty {
				action.isEnabled = false
			}
		}

//		actionAdd.isEnabled = false

		let actionSaveAndAddMore = UIAlertAction(title: "Save and More experience", style: .default) {
			UIAlertAction in
			NSLog("OK Pressed")
		}
		let actionCancel = UIAlertAction(title: "Cancel", style: .destructive)

		alert.addAction(actionAdd)
		alert.addAction(actionSaveAndAddMore)
		alert.addAction(actionCancel)

		present(alert, animated: true, completion: nil)

	}

	@IBAction func addSkills(_ sender: Any) {

		let title = "Add your skill!"
		let message = "Here you can write one of your skills that will appear on the screen."

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

		present(alert, animated: true, completion: nil)
	}

	@IBAction func resetCv(_ sender: Any) {
	}


}

extension CvViewController: UITableViewDelegate {

}

extension CvViewController: UITableViewDataSource {

	func numberOfSections(in tableView: UITableView) -> Int {
		2
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return SetData.shared.data.count
	}

//	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//		<#code#>
//	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(
			withIdentifier: "JobExperienceTableViewCell",
			for: indexPath
		) as? JobExperienceTableViewCell else {
			return UITableViewCell()
		}

		let jobExp = SetData.shared.data[indexPath.row]

		cell.addData(experience: jobExp)

		return cell
	}

//	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//	}

}

//extension CvViewController: UICollectionViewDataSource {
//
//	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//		<#code#>
//	}
//
//
//	func numberOfSections(in collectionView: UICollectionView) -> Int {
//		<#code#>
//	}
//
//	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//		<#code#>
//	}
//
//}

