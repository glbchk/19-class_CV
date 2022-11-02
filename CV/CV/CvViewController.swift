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

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}


	@IBAction func addPorfileData(_ sender: Any) {
	}

	@IBAction func addJobExperience(_ sender: Any) {
		let title = "Add your experience!"
		let message = "Here you can add the experience about your carrier."

		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

		alert.addTextField { (textField) in
			textField.placeholder = "The beginning year of experience"
		}

		alert.addTextField { (textField) in
			textField.placeholder = "The finishing year of experience"
		}

		alert.addTextField { (textField) in
			textField.placeholder = "Company name"
			textField.isSecureTextEntry = true
		}

		alert.addTextField { (textField) in
			textField.placeholder = "Position name"
			textField.isSecureTextEntry = true
		}

		let actionAdd = UIAlertAction(title: "Save experience", style: .default)
		let actionSaveAndAddMore = UIAlertAction(title: "Save and More experience", style: .default)
		let actionCancel = UIAlertAction(title: "Cancel", style: .default)

		alert.addAction(actionAdd)
		alert.addAction(actionSaveAndAddMore)
		alert.addAction(actionCancel)

		present(alert, animated: true, completion: nil)
	}

	@IBAction func addSkills(_ sender: Any) {
	}

	@IBAction func resetCv(_ sender: Any) {
	}


}


//extension CvViewController: UITableViewDataSource {
//
//	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//		<#code#>
//	}
//
//	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//		<#code#>
//	}
//
//	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//		<#code#>
//	}
//
//	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//	}
//
//}
//
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

