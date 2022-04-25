//
//  KisiKayitRouter.swift
//  UsersApp
//
//  Created by Pınar Koçak on 19.04.2022.
//

import Foundation

class KisiKayitRouter: PresenterToRouterLKisiKayitProtocol {
    static func createModule(ref: AddUserViewController) {
        let presenter = KisiKayitPresenter()
        
        ref.kisiKayitPresenterObj = presenter
        ref.kisiKayitPresenterObj?.kisiKayitInteractor = KisiKayitInteractor()
    }
}
