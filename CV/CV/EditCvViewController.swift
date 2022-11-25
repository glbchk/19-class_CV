//
//  EditCVViewController.swift
//  CV
//
//  Created by Glib Galchenko on 02.11.2022.
//

import UIKit

class EditCvViewController: UIViewController {

	@IBOutlet weak var firstNameTextField: UITextField!
	@IBOutlet weak var lastNameTextField: UITextField!
	@IBOutlet weak var userImage: UIImageView!

//	let encoder = JSONEncoder()
//	let decoder = JSONDecoder()
//
//	var cvUserInfo = UserInfo()

	override func viewDidLoad() {
        super.viewDidLoad()

		userImage.layer.masksToBounds = false
		userImage.layer.cornerRadius = userImage.frame.height/2
		userImage.clipsToBounds = true
    }

//	func saveProfileData() {
//		cvUserInfo = UserInfo(firstName: firstNameTextField.text, lastName: lastNameTextField.text, userImage: UserImage(withImage: userImage.image))
//
//		if let encoded = try? encoder.encode(cvUserInfo) {
//			let defaults = UserDefaults.standard
//			defaults.set(encoded, forKey: "userInfo")
//		}
//
//		UserDefaults.standard.synchronize()
//	}
    
	@IBAction func addPicture(_ sender: Any) {
		userImage.image = UIImage(named: "me.jpg")
	}

	@IBAction func removePicture(_ sender: Any) {
		userImage.image = UIImage(named: "standart_profile_icon")
	}

	@IBAction func saveUserData(_ sender: Any) {
		guard let vc = storyboard?.instantiateViewController(withIdentifier: "CvViewController") as? CvViewController else { return }

		vc.loadView()

		vc.cvFirstNameLabel.text = firstNameTextField.text
		vc.cvLastNameLabel.text = lastNameTextField.text
		vc.cvImage.image = userImage.image

		vc.encodeProfileData()
//		vc.encodeProfileData()
		vc.jobExperienceTableView.reloadData()
		vc.skillsCollectionView.reloadData()
		show(vc, sender: nil)
	}
	
	/*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
