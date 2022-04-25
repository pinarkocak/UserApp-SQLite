//
//  DetailViewController.swift
//  UsersApp
//
//  Created by Pınar Koçak on 12.04.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldNumber: UITextField!
    
    var kisiDetayPresenter: ViewToPresenterKisiDetayProtocol?
    
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let p = person {
            textFieldName.text = p.person_name
            textFieldNumber.text = p.person_number
        }
        
        KisiDetayRouter.createModule(ref: self)
    }
    
    @IBAction func btnUpdate(_ sender: Any) {
        if let pName = textFieldName.text, let pNumber = textFieldNumber.text, let p = person {
            kisiDetayPresenter?.guncelle(person_id: p.person_id!, person_name: pName, person_number: pNumber)
        }
    }
}
