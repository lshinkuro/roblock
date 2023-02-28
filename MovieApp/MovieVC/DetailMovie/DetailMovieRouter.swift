// 
//  DetailMovieRouter.swift
//  MovieApp
//
//  Created by Dian Noery on 31/01/23.
//

import UIKit

class DetailMovieRouter {
    
    func showView() -> DetailMovievVC {
        let interactor = DetailMovieInteractor()
        let presenter = DetailMoviePresenter(interactor: interactor)
        let view = DetailMovievVC(nibName: String(describing: DetailMovievVC.self), bundle: nil)
        view.presenter = presenter
        return view
    }
    
}
