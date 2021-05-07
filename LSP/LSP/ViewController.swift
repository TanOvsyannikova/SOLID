//
//  ViewController.swift
//  LSP
//
//  Created by Татьяна Овсянникова on 07.05.2021.
//

import UIKit

class ViewController: UIViewController {
    //user interface elements
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    
    var dataFetcherService = DataFetcherService()
    let dataStore = DataStore()
    
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = 10
        
        dataFetcherService.fetchUsers { (users) in
            print(users?.first?.name)
        }
        
        dataFetcherService.fetchPlaylists { (playlist) in
            print(playlist?.feed.results.first?.name)
        }
        
        dataFetcherService.fetchLocalUsers { (localUsers) in
            print(localUsers?.first?.name)
        }
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

