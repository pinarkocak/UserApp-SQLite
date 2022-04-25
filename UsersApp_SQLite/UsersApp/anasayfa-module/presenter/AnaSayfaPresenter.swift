//
//  AnaSayfaPresenter.swift
//  UsersApp
//
//  Created by Pınar Koçak on 19.04.2022.
//

import Foundation

class AnaSayfaPresenter: ViewToPresenterAnaSayfaProtocol {
    var anaSayfaInteractor: PresenterToInteractorAnaSayfaProtocol?
    
    var anaSayfaView: PresenterToViewAnaSayfaProtocol?
    
    func fetch() {
        anaSayfaInteractor?.fetchAllPeople()
    }
    
    func search(search: String) {
        anaSayfaInteractor?.searchPerson(search: search)
    }
    
    func delete(person_id: Int) {
        anaSayfaInteractor?.deletePerson(person_id: person_id)
    }
}

extension AnaSayfaPresenter: InteractorToPresenterAnaSayfaProtocol {
    func sendDataToPresenter(personList: Array<Person>) {
        anaSayfaView?.sendDataToView(personList: personList)
    }
}
