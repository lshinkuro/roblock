//
//  HomeRouter.swift
//  MovieApp
//
//  Created by Dian Noery on 30/01/23.
//

import Foundation
import UIKit

class HomeRouter {
    
    func showView() -> HomeVC {
        let interactor = HomeInteractor()
        let presenter = HomePresenter(interactor: interactor)
        let view = HomeVC(nibName: String(describing: HomeVC.self), bundle: nil)
        view.presenter = presenter
        
        return view
    }
    
    func navigateDetailMovie(from navigation: UINavigationController, id: String){
        let vc = DetailMovieRouter().showView()
        vc.idMoview = id
        navigation.pushViewController(vc, animated: true)
    }
    
    func navigateListMovie(from navigation: UINavigationController, id: Int){
        let vc = ListMovieRouter().showView()
        vc.idGenre = id
        navigation.pushViewController(vc, animated: true)
    }
    
}
