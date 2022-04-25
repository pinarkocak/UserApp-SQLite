//
//  KisiKayitPresenter.swift
//  UsersApp
//
//  Created by Pınar Koçak on 19.04.2022.
//

import Foundation

class KisiKayitPresenter: ViewToPresenterKisiKayitProtocol {
    var kisiKayitInteractor: PresenterToInteractorKisiKayitProtocol?
    
    func ekle(person_name: String, person_number: String) {
        kisiKayitInteractor?.kisiEkle(person_name: person_name, person_number: person_number)
    }
}
