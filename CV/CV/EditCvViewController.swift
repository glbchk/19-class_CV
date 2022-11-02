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


	override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
	@IBAction func addPicture(_ sender: Any) {
	}

	@IBAction func removePicture(_ sender: Any) {
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
