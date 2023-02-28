// 
//  ListMovieRouter.swift
//  MovieApp
//
//  Created by Dian Noery on 31/01/23.
//

import UIKit

class ListMovieRouter {
    
    func showView() -> ListMovieVC {
        let interactor = ListMovieInteractor()
        let presenter = ListMoviePresenter(interactor: interactor)
        let view = ListMovieVC(nibName: String(describing: ListMovieVC.self), bundle: nil)
        view.presenter = presenter
        return view
    }
    
   
    
}
