//
//  AnaSayfaRouter.swift
//  UsersApp
//
//  Created by Pınar Koçak on 19.04.2022.
//

import Foundation

class AnaSayfaRouter: PresenterToRouterAnaSayfaProtocol {
    static func createModule(ref: MainViewController) {
        let presenter = AnaSayfaPresenter()
        
        //View
        ref.anaSayfaPresenterObj = presenter
        
        //Presenter
        ref.anaSayfaPresenterObj?.anaSayfaInteractor = AnaSayfaInteractor()
        ref.anaSayfaPresenterObj?.anaSayfaView = ref
        
        //Interactor
        ref.anaSayfaPresenterObj?.anaSayfaInteractor?.anaSayfaPresenter = presenter
        
    }
}
