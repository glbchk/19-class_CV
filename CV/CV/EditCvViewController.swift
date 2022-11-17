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

	override func viewDidLoad() {
        super.viewDidLoad()

    }
    
	@IBAction func addPicture(_ sender: Any) {
		userImage.image = UIImage(named: "me.jpg")
		userImage.layer.masksToBounds = false
		userImage.layer.cornerRadius = userImage.frame.height/2
		userImage.clipsToBounds = true
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
		vc.cvImage.layer.masksToBounds = false
		vc.cvImage.layer.cornerRadius = vc.cvImage.frame.height/2
		vc.cvImage.clipsToBounds = true

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
