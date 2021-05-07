//
//  ViewController.swift
//  SRP
//
//  Created by Татьяна Овсянникова on 07.05.2021.
//

import UIKit

class ViewController: UIViewController {
    //user interface elements
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    var networkService = NetworkService()
    let dataStore = DataStore()
    
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = 10
        
        networkService.dataFetcher(urlString: "https://www.hackingwithswift.com/samples/friendface.json")
    }
    
    
    //MARK: - Business logic
    func changeName() {
        guard let name = textLabel.text, name != "" else {
            showAlert()
            return
        }
        
        dataStore.saveNameInCache(name: name)
    }
    
    //MARK: - User Interface
    
    func showAlert() {
        let ac = UIAlertController(title: "Oops", message: "Seems that you haven't entered your name", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    //user interaction with interface
    @IBAction func changeLabel(_ sender: Any) {
        textLabel.text = myTextField.text
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        changeName()
    }
    
}

