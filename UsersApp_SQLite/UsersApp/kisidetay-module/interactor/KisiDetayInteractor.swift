//
//  KisiDetayInteractor.swift
//  UsersApp
//
//  Created by Pınar Koçak on 19.04.2022.
//

import Foundation

class KisiDetayInteractor: PresenterToInteractorKisiDetayProtocol {
    let db: FMDatabase?
    
    init() {
        let targertPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: targertPath).appendingPathComponent("rehber.sqlite")
        db = FMDatabase(path: databaseURL.path)
    }
    
    func kisiGuncelle(person_id: Int, person_name: String, person_number: String) {
        db?.open()
        
        do {
            try db!.executeUpdate("UPDATE People SET person_name = ?, person_number = ? WHERE person_id = ?", values: [person_name,person_number,person_id])
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
