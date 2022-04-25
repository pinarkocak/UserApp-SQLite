//
//  AddUserViewController.swift
//  UsersApp
//
//  Created by Pınar Koçak on 12.04.2022.
//

import UIKit

class AddUserViewController: UIViewController {

    @IBOutlet weak var textFieldName: UITextField!
    @IBOutlet weak var textFieldNumber: UITextField!
    
    var kisiKayitPresenterObj: ViewToPresenterKisiKayitProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        KisiKayitRouter.createModule(ref: self)
    }
    
    @IBAction func btnSave(_ sender: Any) {
        if let pName = textFieldName.text, let pNumber = textFieldNumber.text {
            kisiKayitPresenterObj?.ekle(person_name: pName, person_number: pNumber)
        }
    }
}
