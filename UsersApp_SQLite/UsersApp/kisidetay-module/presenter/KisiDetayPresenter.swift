//
//  KisiDetayPresenter.swift
//  UsersApp
//
//  Created by Pınar Koçak on 19.04.2022.
//

import Foundation

class KisiDetayPresenter: ViewToPresenterKisiDetayProtocol {
    var kisiDetayInteractor: PresenterToInteractorKisiDetayProtocol?
    
    func guncelle(person_id: Int, person_name: String, person_number: String) {
        kisiDetayInteractor?.kisiGuncelle(person_id: person_id, person_name: person_name, person_number: person_number)
    }
}
