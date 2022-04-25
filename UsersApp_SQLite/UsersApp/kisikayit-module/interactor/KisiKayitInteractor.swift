//
//  KisiKayitInteractor.swift
//  UsersApp
//
//  Created by Pınar Koçak on 19.04.2022.
//

import Foundation

class KisiKayitInteractor: PresenterToInteractorKisiKayitProtocol {
    
    let db: FMDatabase?
    
    init() {
        let targertPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: targertPath).appendingPathComponent("rehber.sqlite")
        db = FMDatabase(path: databaseURL.path)
    }
    
    func kisiEkle(person_name: String, person_number: String) {
        db?.open()
        
        do {
            try db!.executeUpdate("INSERT INTO People (person_name,person_number) VALUES (?,?)", values: [person_name,person_number])
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
