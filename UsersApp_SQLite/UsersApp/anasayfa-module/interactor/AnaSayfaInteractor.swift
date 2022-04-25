//
//  AnaSayfaInteractor.swift
//  UsersApp
//
//  Created by Pınar Koçak on 19.04.2022.
//

import Foundation

class AnaSayfaInteractor: PresenterToInteractorAnaSayfaProtocol {
    var anaSayfaPresenter: InteractorToPresenterAnaSayfaProtocol?
    
    let db: FMDatabase?
    
    init() {
        let targertPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: targertPath).appendingPathComponent("rehber.sqlite")
        db = FMDatabase(path: databaseURL.path)
    }
    
    func fetchAllPeople() {
        var list = [Person]()

        db?.open()
        
        do {
            let result = try db!.executeQuery("SELECT * FROM People", values: nil)
            
            while result.next() {
                let person = Person(person_id: Int(result.string(forColumn: "person_id"))!,
                                    person_name: result.string(forColumn: "person_name")!,
                                    person_number: result.string(forColumn: "person_number")!)
                list.append(person)
            }
            
            anaSayfaPresenter?.sendDataToPresenter(personList: list)
            
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func searchPerson(search: String) {
        var list = [Person]()

        db?.open()
        
        do {
            let result = try db!.executeQuery("SELECT * FROM People WHERE person_name LIKE '%\(search)%'", values: nil)
            
            while result.next() {
                let person = Person(person_id: Int(result.string(forColumn: "person_id"))!,
                                    person_name: result.string(forColumn: "person_name")!,
                                    person_number: result.string(forColumn: "person_number")!)
                list.append(person)
            }
            
            anaSayfaPresenter?.sendDataToPresenter(personList: list)
            
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func deletePerson(person_id: Int) {
        db?.open()
        
        do {
            try db!.executeUpdate("DELETE FROM People WHERE person_id = ?", values: [person_id])
            fetchAllPeople()
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
