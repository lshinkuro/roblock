// 
//  DetailMovieRouter.swift
//  MovieApp
//
//  Created by Dian Noery on 31/01/23.
//

import UIKit

class DetailMovieRouter {
    
    func showView() -> DetailMovieView {
        let interactor = DetailMovieInteractor()
        let presenter = DetailMoviePresenter(interactor: interactor)
        let view = DetailMovieView(nibName: String(describing: DetailMovieView.self), bundle: nil)
        view.presenter = presenter
        return view
    }
    
    //Navigate to other xib-based router
    /*
    func navigateToOtherView(from navigation: UINavigationController, with data: Any) {
        let otherView = OtherViewRouter().showView(with: data)
        navigation.pushViewController(otherView, animated: true)
    }
    */
    
    //Navigate to other storyboard-based router
    /*
    func navigateToOtherView(from navigation: UINavigationController, with data: Any) {
        let otherView = OtherViewRouter().showView(with: data)
        navigation.pushViewController(otherView, animated: true)
    }
     */
    
}
