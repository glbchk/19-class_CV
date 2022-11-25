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
	var cvUserInfo = UserInfo()

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

		decodeProfileData()
		decodeExpData()
		decodeSkillsData()

		cvImage.layer.masksToBounds = false
		cvImage.layer.cornerRadius = cvImage.frame.height/2
		cvImage.clipsToBounds = true

		self.jobExperienceTableView.separatorStyle = .none

	}

	func encodeProfileData() {
		cvUserInfo = UserInfo(firstName: cvFirstNameLabel.text, lastName: cvLastNameLabel.text, userImage: UserImage(withImage: cvImage.image))

		if let encoded = try? encoder.encode(cvUserInfo) {
			let defaults = UserDefaults.standard
			defaults.set(encoded, forKey: "userInfo")
		}

		UserDefaults.standard.synchronize()
	}

	func encodeExpData() {

		if let encoded = try? encoder.encode(allJobExp) {
			let defaults = UserDefaults.standard
			defaults.set(encoded, forKey: "jobExp")
		}

		UserDefaults.standard.synchronize()

	}

	func encodeSkillsData() {

		if let encoded = try? encoder.encode(allSkills) {
			let defaults = UserDefaults.standard
			defaults.set(encoded, forKey: "jobSkill")
		}

		UserDefaults.standard.synchronize()

	}

	func decodeProfileData() {
		if let savedUser = UserDefaults.standard.object(forKey: "userInfo") as? Data {
			if let loadedUserInfo = try? decoder.decode(UserInfo.self, from: savedUser) {
				cvFirstNameLabel.text = loadedUserInfo.firstName
				cvLastNameLabel.text = loadedUserInfo.lastName
				cvImage.image = loadedUserInfo.userImage?.getImage()
			}
		}

		UserDefaults.standard.synchronize()

	}

	func decodeExpData() {

		if let savedJobExp = UserDefaults.standard.object(forKey: "jobExp") as? Data {
			if let loadedJobExp = try? decoder.decode([Experience].self, from: savedJobExp) {
				for exp in loadedJobExp {
					allJobExp.append(exp)
				}
				jobExperienceTableView.reloadData()
			}
		}

		UserDefaults.standard.synchronize()

	}

	func decodeSkillsData() {

		if let savedSkill = UserDefaults.standard.object(forKey: "jobSkill") as? Data {
			if let loadedSkill = try? decoder.decode([Skills].self, from: savedSkill) {
				for skill in loadedSkill {
					allSkills.append(skill)
				}
				skillsCollectionView.reloadData()
			}
		}

		UserDefaults.standard.synchronize()

	}


	@IBAction func addPorfileData(_ sender: Any) {
	}

	@IBAction func addJobExperience(_ sender: Any) {

		let title = "Add your experience!"
		let message = "Here you can add the experience about your carrier."

		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

			alert.addTextField { (textField) in
				self.startDateTextField = textField
				textField.placeholder = "The beginning year of experience"
			}

			alert.addTextField { (textField) in
				self.endDateTextField = textField
				textField.placeholder = "The finishing year of experience"
			}

			alert.addTextField { (textField) in
				self.companyNameTextField = textField
				textField.placeholder = "Company name"
			}

			alert.addTextField { (textField) in
				self.positionNameTextField = textField
				textField.placeholder = "Position name"
			}

			let actionAdd = UIAlertAction(title: "Save experience", style: .default) { [self]
				(action: UIAlertAction!) -> Void in
				let savedData = Experience(startDate: startDateTextField.text ?? "", endDate: endDateTextField.text ?? "", companyName: companyNameTextField.text ?? "", positionName: positionNameTextField.text ?? "")
				allJobExp.append(savedData)
				encodeExpData()

				jobExperienceTableView.reloadData()
			}

			let actionSaveAndAddMore = UIAlertAction(title: "Save and Add more experience", style: .default) { [self]
				(action: UIAlertAction!) -> Void in
				alert.textFields?.forEach { field in
					field.text = ""
				}

				let savedExp = Experience(startDate: startDateTextField.text ?? "", endDate: endDateTextField.text ?? "", companyName: companyNameTextField.text ?? "", positionName: positionNameTextField.text ?? "")
				allJobExp.append(savedExp)
				encodeExpData()

				jobExperienceTableView.reloadData()

				present(alert, animated: true, completion: nil)
			}

			let actionCancel = UIAlertAction(title: "Cancel", style: .destructive)

			alert.addAction(actionAdd)
			alert.addAction(actionSaveAndAddMore)
			alert.addAction(actionCancel)

			present(alert, animated: true, completion: nil)
	}

	@IBAction func addSkills(_ sender: Any) {

		let title = "Add your skill!"
		let message = "Here you can write one of your skills and set the rate of your skill from 1-3."

		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

			alert.addTextField { (textField) in
				self.skillTextField = textField

				if let image = UIImage(named: self.skillTextField.text ?? "") {
					self.skillImage = image
				}
				textField.placeholder = "Write your skill"
			}

			alert.addTextField { (textField) in
				self.ratingSkillTextField = textField
				textField.placeholder = "Set your rate for askill"
			}

		let actionAdd = UIAlertAction(title: "Save skill", style: .default) { [self]
				(action: UIAlertAction!) -> Void in

				if ratingSkillTextField.text == "1" || ratingSkillTextField.text == "2" || ratingSkillTextField.text == "3" {

					let savedSkill = Skills(skillsName: skillTextField.text?.lowercased() ?? "", rating: Int(ratingSkillTextField.text!)!)
					allSkills.append(savedSkill)
					encodeSkillsData()

					skillsCollectionView.reloadData()

				} else {
					action.isEnabled = false

					alert.textFields?.forEach { field in
						field.text = ""
					}

					action.isEnabled = true
					present(alert, animated: true, completion: nil)
				}

			}

		let actionSaveAndAddMore = UIAlertAction(title: "Save and Add more skills", style: .default) { [self]
			(action: UIAlertAction!) -> Void in

				alert.textFields?.forEach { field in
					field.text = ""
				}

				if ratingSkillTextField.text == "1" || ratingSkillTextField.text == "2" || ratingSkillTextField.text == "3" {

					let savedSkill = Skills(skillsName: skillTextField.text?.lowercased() ?? "", rating: Int(ratingSkillTextField.text!)!)
					allSkills.append(savedSkill)
					encodeSkillsData()

					skillsCollectionView.reloadData()

					present(alert, animated: true, completion: nil)

				} else {
					action.isEnabled = false

					alert.textFields?.forEach { field in
						field.text = ""
					}

					action.isEnabled = true
					present(alert, animated: true, completion: nil)
				}

			}

			let actionCancel = UIAlertAction(title: "Cancel", style: .destructive)

			alert.addAction(actionAdd)
			alert.addAction(actionSaveAndAddMore)
			alert.addAction(actionCancel)

			present(alert, animated: true, completion: nil)
	}

	@IBAction func resetCv(_ sender: Any) {

		UserDefaults.standard.removeObject(forKey: "jobExp")
		UserDefaults.standard.removeObject(forKey: "jobSkill")
		UserDefaults.standard.removeObject(forKey: "userInfo")

//		UserDefaults.standard.synchronize()

		jobExperienceTableView.reloadData()
		skillsCollectionView.reloadData()
		loadView()
	}


}

extension CvViewController: UITableViewDataSource {

	func numberOfSections(in tableView: UITableView) -> Int {
		1
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return allJobExp.count
	}

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

}

extension CvViewController: UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return allSkills.count
	}


	func numberOfSections(in collectionView: UICollectionView) -> Int {
		1
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 0
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

extension CvViewController: UITableViewDelegate {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

		CGSize(width: 74, height: 142)
	}

}

