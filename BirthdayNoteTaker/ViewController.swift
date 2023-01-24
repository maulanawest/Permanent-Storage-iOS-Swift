//
//  ViewController.swift
//  BirthdayNoteTaker
//
//  Created by west on 24/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //storage
        let storeName = UserDefaults.standard.object(forKey: "name")
        let storeBirtDay = UserDefaults.standard.object(forKey: "birthday")
        
        
        //Casting - as? vs as! force(memaksa) casting
        //casting adalah konversi suatu variabel dari satu tipe data ke dalam bentuk tipe data lain
        if let name = storeName as? String {
            nameLabel.text = "Name: \(name)"
        }
        
        if let birthday = storeBirtDay as? String {
            birthdayLabel.text = "Birthday: \(birthday)"
        }
    }
    
    
    @IBAction func saveClick(_ sender: Any) {
        UserDefaults.standard.set(nameTextField.text, forKey: "name")
        UserDefaults.standard.set(birthdayTextField.text, forKey: "birthday")
//        UserDefaults.standard.synchronize()
        
        nameLabel.text = "Name: \(nameTextField.text!)"
        birthdayLabel.text = "Birthday: \(birthdayTextField.text!)"
    }
    
    @IBAction func deleteClick(_ sender: Any) {
        
        let removeName = UserDefaults.standard.object(forKey: "name")
        let removeBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        //" " vs nil
        if (removeName as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "name")
            nameLabel.text = "Name:"
        }
        
        if (removeBirthday as? String) != nil {
            UserDefaults.standard.removeObject(forKey: "birthday")
            birthdayLabel.text = "Birthday:"
        }
        
    }
}
