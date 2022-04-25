//
//  Person.swift
//  UsersApp
//
//  Created by Pınar Koçak on 12.04.2022.
//

class Person {
    var person_id: Int?
    var person_name: String?
    var person_number: String?
    
    init(person_id: Int, person_name: String, person_number: String) {
        self.person_id = person_id
        self.person_name = person_name
        self.person_number = person_number
    }
}
