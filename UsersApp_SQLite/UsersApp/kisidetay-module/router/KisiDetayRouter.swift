//
//  KisiDetayRouter.swift
//  UsersApp
//
//  Created by Pınar Koçak on 19.04.2022.
//

import Foundation

class KisiDetayRouter: PresenterToRouterKisiDetayProtocol {
    static func createModule(ref: DetailViewController) {
        let presenter = KisiDetayPresenter()
        
        ref.kisiDetayPresenter = presenter
        ref.kisiDetayPresenter?.kisiDetayInteractor = KisiDetayInteractor()
    }
}
