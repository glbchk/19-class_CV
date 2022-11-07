//
//  EditCVViewController.swift
//  CV
//
//  Created by Glib Galchenko on 02.11.2022.
//

import UIKit

class EditCVViewController: UIViewController {

	@IBOutlet weak var firstNameTextField: UITextField!
	@IBOutlet weak var lastNameTextField: UITextField!
	@IBOutlet weak var userImage: UIImageView!


	override func viewDidLoad() {
        super.viewDidLoad()

    }
    
	@IBAction func addPicture(_ sender: Any) {
		//No idea how to do
	}

	@IBAction func removePicture(_ sender: Any) {
		//Connected to adding image
	}

	@IBAction func saveUserData(_ sender: Any) {
		guard let vc = storyboard?.instantiateViewController(withIdentifier: "CvViewController") as? CvViewController else { return }

		vc.loadView()

		vc.cvFirstNameLabel.text = firstNameTextField.text
		vc.cvLastNameLabel.text = lastNameTextField.text

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
